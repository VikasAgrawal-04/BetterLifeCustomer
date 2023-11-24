import 'dart:async';

import 'package:api/constants/endpoints.dart';
import 'package:api_client/api_client.dart';
import 'package:api_client/configs/client.dart';
import 'package:hive_storage/hive_storage.dart';
import 'package:notifications/notifications.dart';

import 'auth_repo.dart';
import 'models/models.dart';
import 'storage/storage_service.dart';

class AuthRepoImpl implements AuthRepo {
  final Client client;
  final Box box;
  final StorageService storage;

  AuthRepoImpl({
    required this.client,
    required this.box,
  }) : storage = StorageService(box: box) {
    client.token = storage.getToken();
  }

  @override
  Future<ApiResult<SignupResponseModel>> signUp(
      {required SignUpModel data}) async {
    try {
      final result =
          await client.post(Endpoints.signUp, queryParameters: data.toJson());
      final model = SignupResponseModel(
        status: int.parse(result.data['code']),
        message: result.data['message'],
      );
      if (model.status != 200) {
        return ApiResult.failure(
          error: NetworkExceptions.defaultError(_parseError(result.data)),
        );
      }

      return ApiResult.success(data: model);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<SignInResponse>> signIn({required LoginParams data}) async {
    try {
      final result = await client.post(
        Endpoints.loginCustomer,
        queryParameters: (data.toJson()),
      );

      final map = result.data as Map;
      final isSuccess = map['code'] == '200';
      if (!isSuccess) {
        const key = 'isOtpVerified';
        if (map.containsKey('data')) {
          final data = map['data'];
          if (data is Map) {
            if (data.containsKey(key)) {
              final isOtpVerified = data[key] != '0';
              if (!isOtpVerified) {
                final response = SignInResponse(
                  isOtpVerified: false,
                  message: map['message'],
                );
                return ApiResult.success(data: response);
              }
            }
          }
        }
      }
      if (map['code'] == '500') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      final ApiResultParser parser = ApiResultParser.parse(data: result.data);
      if (parser.hasError) {
        return ApiResult.failure(error: parser.failure);
      }
      final model = SignInResponse.fromJson(result.data);

      await Future.wait(
        [
          storage.setToken(model.user!.userToken!),
          storage.setUser(model.user!.toJson()),
          storage.setIsLoggedIn(true),
        ],
      );
      return ApiResult.success(data: model);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ResponseModel>> forgotPassword(
      {required ResetPasswordParams params}) async {
    try {
      final result = await client.post(Endpoints.resetPassword,
          queryParameters: params.toJson());
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      final model = ResponseModel.fromMap(result.data);
      return ApiResult.success(data: model);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ResponseModel>> sendOtp({required String number}) async {
    try {
      final result = await client
          .post(Endpoints.sendOtp, queryParameters: {'mobileNumber': number});
      if (result.data['code'] != '200') {
        return ApiResult.failure(
          error: NetworkExceptions.defaultError(result.data['message']),
        );
      }
      final model = ResponseModel.fromMap(result.data);
      return ApiResult.success(data: model);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ResetPasswordData>> verifyOtp(
      {required OtpModel model}) async {
    try {
      final result = await client.post(Endpoints.verifyOtp,
          queryParameters: model.toJson());
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      final data = ResetPasswordData(
          contactNumber: model.mobileNumber, message: result.data['message']);
      return ApiResult.success(data: data);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ResetPasswordData>> verifyPasswordOtp(
      {required OtpModel model}) async {
    try {
      final result = await client.post(
        Endpoints.verifyPasswordOTP,
        queryParameters: model.toJson(),
      );
      if (result.data['code'] != '200') {
        return ApiResult.failure(
          error: NetworkExceptions.defaultError(result.data['message']),
        );
      }

      final token = result.data['data']['userToken'];
      if (token == null) {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }

      client.setToken(token);

      final data = ResetPasswordData(
        contactNumber: model.mobileNumber,
        message: result.data['message'],
      );
      return ApiResult.success(data: data);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  User? getUser() => storage.getUser();

  @override
  Future<void> logout() async {
    await storage.setIsLoggedIn(false);
    await storage.removeToken();
    await storage.removeUser();
  }

  @override
  bool get isLoggedIn => storage.isLoggedIn;

  @override
  Stream<User?> get userStream => storage.userStream;

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
  Future<ApiResult<List<String>>> fetchLanguage() async {
    try {
      List<String> language = [];
      final result = await client.get(Endpoints.languages);
      if (result.statusCode != 200) {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      language.addAll((result.data['data'] as List<dynamic>)
          .map((e) => e['language'].toString())
          .toList());
      return ApiResult.success(data: language);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<List<Map<String, dynamic>>>> fetchPincodes() async {
    try {
      final pincodes = <Map<String, dynamic>>[];
      final result = await client.get(Endpoints.pincodes);
      if (result.statusCode != 200) {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      pincodes.addAll(
          (result.data['data'] as List<dynamic>).map((e) => Map.from(e)));
      return ApiResult.success(data: pincodes);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<Map<String, dynamic>>> registerCaretaker(
      {required SignUpCaretakerModel data}) async {
    try {
      final result =
          await client.post(Endpoints.signUpCaretaker, data: data.toJson());
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      return ApiResult.success(data: result.data);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ResetPasswordData>> verifyCaretakerOtp(
      {required OtpModel model}) async {
    try {
      final result = await client.post(Endpoints.verifyCareTakerOtp,
          queryParameters: model.toJson());
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      final data = ResetPasswordData(
          contactNumber: model.mobileNumber, message: result.data['message']);

      return ApiResult.success(data: data);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<Map<String, dynamic>>> updateToken() async {
    try {
      final token = await PushNotificationService().getFCMtoken();
      final result = await client
          .post(Endpoints.updateToken, data: {'firebase_device_token': token});
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      return ApiResult.success(data: result.data);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<Map<String, dynamic>>> fetchCarePincodes() async {
    try {
      final result = await client.post(Endpoints.caretakerPincodes);
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      return ApiResult.success(data: result.data);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<Map<String, dynamic>>> addCarePincode(String pincode) async {
    try {
      final result = await client
          .post(Endpoints.addPincode, queryParameters: {'pincode': pincode});
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      return ApiResult.success(data: result.data);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<Map<String, dynamic>>> deleteCarePincode(
      String pincode) async {
    try {
      final result = await client
          .post(Endpoints.deletePincode, queryParameters: {'pincode': pincode});
      if (result.data['code'] != '200') {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(result.data['message']));
      }
      return ApiResult.success(data: result.data);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
