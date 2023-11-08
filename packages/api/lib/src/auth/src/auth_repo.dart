import 'package:api_client/api_client.dart';

import 'models/models.dart';

abstract class AuthRepo {
  Future<ApiResult<SignupResponseModel>> signUp({required SignUpModel data});
  Future<ApiResult<SignInResponse>> signIn({required LoginParams data});
  Future<ApiResult<ResponseModel>> forgotPassword(
      {required ResetPasswordParams params});
  Future<ApiResult<ResetPasswordData>> verifyOtp({required OtpModel model});

  Future<ApiResult<ResponseModel>> sendOtp({required String number});
  Future<ApiResult<ResetPasswordData>> verifyPasswordOtp(
      {required OtpModel model});
  Future<ApiResult<List<String>>> fetchLanguage();
  Future<ApiResult<List<Map<String, dynamic>>>> fetchPincodes();
  Future<ApiResult<Map<String, dynamic>>> registerCaretaker(
      {required SignUpCaretakerModel data});
  Future<ApiResult<ResetPasswordData>> verifyCaretakerOtp(
      {required OtpModel model});

  Future<ApiResult<Map<String, dynamic>>> updateToken();

  User? getUser();
  bool get isLoggedIn;

  Future<void> logout();
  Stream<User?> get userStream;
}
