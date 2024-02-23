import 'package:api/api.dart';
import 'package:api/constants/endpoints.dart';
import 'package:api/src/auth/src/storage/storage_service.dart';
import 'package:api_client/api_result/api_result.dart';
import 'package:api_client/api_result/network_exceptions/network_exceptions.dart';
import 'package:api_client/configs/client.dart';
import 'package:flutter/material.dart';

class CaretakerRepoImpl implements CaretakerRepo {
  final Client client;
  final StorageService storage;

  CaretakerRepoImpl({
    required this.client,
    required this.storage,
  });

  String _parseError(Map? data) {
    String error = 'Something went wrong';
    if (data?.isEmpty ?? true) return error;

    if ((data?.containsKey('code') ?? false) && data!['code'] == '404') {
      if (data.containsKey('message')) {
        return error = data['message'];
      }
    }

    if (data!.containsKey('status') && data['status'] == false) {
      if (data.containsKey('data')) {
        error = '';
        final dataMap = data['data'] as Map;
        dataMap.forEach((key, value) {
          if (value is List) {
            for (var element in value) {
              error += '$element\n';
            }
          } else {
            error += '$value\n';
          }
        });
      }
    }
    return error;
  }

  @override
  Future<ApiResult<List<CareAppointment>>> getNewAppointment() async {
    try {
      final list = <CareAppointment>[];
      final result = await client.put(Endpoints.newAppointment);
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      for (final data in result.data['data'] as List<dynamic>) {
        list.add(CareAppointment.fromJson(data));
      }
      return ApiResult.success(data: list);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<List<CareAppointment>>> getCareAppointment(
      {required AppointmentType type}) async {
    try {
      final list = <CareAppointment>[];
      final endPoint = {
        AppointmentType.present: Endpoints.todayAppointment,
        AppointmentType.past: Endpoints.pastAppointment,
        AppointmentType.future: Endpoints.upcomingAppointment,
      };
      final result = await client.put(endPoint[type]!);
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      for (final data in result.data['data'] as List<dynamic>) {
        list.add(CareAppointment.fromJson(data));
      }
      return ApiResult.success(data: list);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<Map<String, dynamic>>> appointmentAction(
      {required bool accept, required int aptId}) async {
    try {
      final endpoint = {
        true: Endpoints.acceptAppointment,
        false: Endpoints.rejectAppointment
      };
      final result = await client
          .put(endpoint[accept]!, queryParameters: {'apptid': aptId});
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      return ApiResult.success(data: result.data);
    } catch (error) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<ApiResult<CareAppointmentDetails>> getApptDetails(int apptId) async {
    try {
      final result = await client.put("${Endpoints.showAptDetail}/$apptId");
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      print(result.data);
      return ApiResult.success(
          data: CareAppointmentDetails.fromJson(result.data));
    } catch (error) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<ApiResult<Map<String, dynamic>>> verifyPatientOtp(
      {required String otp, required int apptId}) async {
    try {
      final result = await client.put('${Endpoints.startAppointment}/$apptId',
          queryParameters: {'otp': otp});
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      return ApiResult.success(data: result.data);
    } catch (error) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<ApiResult<Map<String, dynamic>>> createDocNotes(
      {required String notes,
      required List<String> imgs,
      required int apptId}) async {
    try {
      final result =
          await client.post('${Endpoints.doctorNotes}/$apptId', data: {
        'notes': [notes],
        'image': imgs
      });
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      return ApiResult.success(data: result.data);
    } catch (error) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<ApiResult<Map<String, dynamic>>> createDietRestriction(
      {required String notes,
      required List<String> imgs,
      required int apptId}) async {
    try {
      final result =
          await client.post('${Endpoints.dietRestriction}/$apptId', data: {
        'notes': [notes],
        'image': imgs
      });
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      return ApiResult.success(data: result.data);
    } catch (error) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<ApiResult<Map<String, dynamic>>> createPrescription(
      {required List<String> imgs, required int apptId}) async {
    try {
      final result = await client
          .post('${Endpoints.prescription}/$apptId', data: {'image': imgs});
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      return ApiResult.success(data: result.data);
    } catch (error) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<ApiResult<Map<String, dynamic>>> createTests(
      {required List<String> imgs,
      required int apptId,
      required List<String> tests}) async {
    try {
      final result = await client.post('${Endpoints.recTests}/$apptId',
          data: {'notes': tests, 'image': imgs});
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      return ApiResult.success(data: result.data);
    } catch (error) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<ApiResult<Map<String, dynamic>>> endAppt(int apptId) async {
    try {
      final result =
          await client.put('${Endpoints.completeAppointment}/$apptId');
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      return ApiResult.success(data: result.data);
    } catch (error) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<ApiResult<Map<String, dynamic>>> getAppInfo() async {
    try {
      final result = await client.get(Endpoints.appInfo);
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      return ApiResult.success(data: result.data);
    } catch (error) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<ApiResult<Map<String, dynamic>>> startLocation(
      String status, int apptId, double latitude, double longitude) async {
    try {
      final result = await client.post(Endpoints.setLocation, queryParameters: {
        "caretakerLatitude": latitude,
        "caretakerLongitude": longitude,
        "caretakerApptStatus": status,
        "apptid": apptId
      });
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      return ApiResult.success(data: result.data);
    } catch (error) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(error));
    }
  }

  @override
  Future<ApiResult<CareLocation>> getLocation(int apptId) async {
    try {
      final result = await client.get('${Endpoints.getLocation}/$apptId');
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      return ApiResult.success(
          data: CareLocation.fromJson(result.data['data']));
    } catch (error, stack) {
      debugPrintStack(stackTrace: stack);
      return ApiResult.failure(error: NetworkExceptions.getDioException(error));
    }
  }
}
