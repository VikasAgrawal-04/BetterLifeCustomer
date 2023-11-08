import 'package:api/constants/endpoints.dart';
import 'package:api/src/auth/src/storage/storage_service.dart';
import 'package:api/src/caretaker/src/caretaker_repo.dart';
import 'package:api/src/caretaker/src/models/appointment/care_appointment.dart';
import 'package:api/src/caretaker/src/models/appointment/care_appointment_details.dart';
import 'package:api/src/user/src/models/appointment_type.dart';
import 'package:api_client/api_result/api_result.dart';
import 'package:api_client/api_result/network_exceptions/network_exceptions.dart';
import 'package:api_client/configs/client.dart';

class CaretakerRepoImpl implements CaretakerRepo {
  final Client client;
  final StorageService storage;

  CaretakerRepoImpl({
    required this.client,
    required this.storage,
  });

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
}
