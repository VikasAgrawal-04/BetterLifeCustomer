import 'package:api_client/api_client.dart';

import 'models/models.dart';

abstract class AuthRepo {
  Future<ApiResult<SignupResponseModel>> signUp({required SignUpModel data});
  Future<ApiResult<User>> signIn({required LoginParams data});
  Future<ApiResult<ResponseModel>> forgotPassword(
      {required ResetPasswordParams params});
  Future<ApiResult<ResetPasswordData>> verifyOtp({required OtpModel model});
  Future<ApiResult<ResponseModel>> sendOtp({required String number});
  // Future<ApiResult<User>> verifyOtp({required OtpModel otpModel});
  // Future<ApiResult<User>> updateUser({required User user});
  // Future<ApiResult<ResponseModel>> forgotPassword({required String email});
  // Future<ApiResult<ResponseModel>> resetPassword({required OtpModel model});
  User? getUser();
  // UserData? getUserData();

  // Future<void> setUserData(UserData userData);
  bool get isLoggedIn;

  Future<void> logout();
  // String? getToken();
  Stream<User?> get userStream;
  // Stream<UserData?> get userDataStream;
  // Stream<List<UserRoles>?> get userRolesStream;
}
