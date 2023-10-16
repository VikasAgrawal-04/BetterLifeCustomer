import 'package:api/src/api_repo.dart';
import 'package:api/src/auth/src/storage/storage_service.dart';
import 'package:api/src/caretaker/caretaker_repo.dart';
import 'package:api/src/caretaker/caretaker_repo_impl.dart';
import 'package:api_client/api_result/api_result.dart';
import 'package:api_client/configs/client.dart';
import 'package:hive_storage/hive_storage.dart';

import 'auth/auth_repo.dart';
import 'user/user_repo.dart';

class ApiRepoImpl implements ApiRepo {
  final Client client;
  final AuthRepo _authRepo;
  final UserRepo _userRepo;
  final CaretakerRepo _careRepo;

  ApiRepoImpl({
    required this.client,
    required Box box,
  })  : _authRepo = AuthRepoImpl(client: client, box: box),
        _userRepo =
            UserRepoImpl(client: client, storage: StorageService(box: box)),
        _careRepo = CaretakerRepoImpl(
            client: client, storage: StorageService(box: box)) {
    init(box);
  }

  Future<void> init(Box box) async {
    final storage = StorageService(box: box);
    storage.tokenStream.listen((event) {
      client.token = event;
    });
  }

  @override
  User? getUser() => _authRepo.getUser();

  @override
  bool get isLoggedIn => _authRepo.isLoggedIn;

  @override
  Future<void> logout() => _authRepo.logout();

  @override
  Future<ApiResult<SignInResponse>> signIn({required LoginParams data}) {
    return _authRepo.signIn(data: data);
  }

  @override
  Future<ApiResult<SignupResponseModel>> signUp({required SignUpModel data}) {
    return _authRepo.signUp(data: data);
  }

  @override
  Stream<User?> get userStream => _authRepo.userStream;

  @override
  Future<ApiResult<List<Appointment>>> getAppointments(
      {required AppointmentType type}) {
    return _userRepo.getAppointments(type: type);
  }

  @override
  Future<ApiResult<TransactionsResponseModel>> getTransactions(
      {required String id}) {
    return _userRepo.getTransactions(id: id);
  }

  @override
  Future<ApiResult<ProfileUpdateResponseModel>> updateProfile(
      {required UpdateProfileParams params}) {
    return _userRepo.updateProfile(params: params);
  }

  @override
  Future<ApiResult<ResponseModel>> forgotPassword(
      {required ResetPasswordParams params}) {
    return _authRepo.forgotPassword(params: params);
  }

  @override
  Future<ApiResult<ResponseModel>> sendOtp({required String number}) {
    return _authRepo.sendOtp(number: number);
  }

  @override
  Future<ApiResult<ResetPasswordData>> verifyOtp({required OtpModel model}) {
    return _authRepo.verifyOtp(model: model);
  }

  @override
  Future<ApiResult<String>> resetPassword(ResetPasswordParams params) {
    return _userRepo.resetPassword(params);
  }

  @override
  Future<ApiResult<AppointmentResponse>> createAppointment(
      CreateAppointmentParams params) {
    return _userRepo.createAppointment(params);
  }

  @override
  Future<ApiResult<Appointment>> viewAppointment(
      {required int appointmentId, required AppointmentType type}) {
    return _userRepo.viewAppointment(appointmentId: appointmentId, type: type);
  }

  @override
  Future<ApiResult<List<String>>> viewDiets({required int appointmentId}) {
    return _userRepo.viewDiets(appointmentId: appointmentId);
  }

  @override
  Future<ApiResult<List<String>>> viewNotes({required int appointmentId}) {
    return _userRepo.viewNotes(appointmentId: appointmentId);
  }

  @override
  Future<ApiResult<List<String>>> viewTests({required int appointmentId}) {
    return _userRepo.viewTests(appointmentId: appointmentId);
  }

  @override
  Future<ApiResult<String>> rescheduleAppointment(
      {required RescheduleAppointmentParams params}) {
    return _userRepo.rescheduleAppointment(params: params);
  }

  @override
  Future<ApiResult<String>> cancelAppointment({required int appointmendId}) {
    return _userRepo.cancelAppointment(appointmendId: appointmendId);
  }

  @override
  Future<ApiResult<String>> serviceRating(
      {required ServiceRatingParams params}) {
    return _userRepo.serviceRating(params: params);
  }

  @override
  Future<ApiResult<List<String>>> viewPrescriptions(
      {required int appointmentId}) {
    return _userRepo.viewPrescriptions(appointmentId: appointmentId);
  }

  @override
  Future<ApiResult<List<Caretaker>>> previousCaretaker() {
    return _userRepo.previousCaretaker();
  }

  @override
  Future<ApiResult<String>> selectPreviousCareTakers(
      SelectCaretakerParams params) {
    return _userRepo.selectPreviousCareTakers(params);
  }

  @override
  Stream<List<Appointment>> getAppointmentStream(
      {required AppointmentType type}) {
    return _userRepo.getAppointmentStream(type: type);
  }

  @override
  Future<ApiResult<AppointmentDetails>> getLastAppointment(
      LastAppointmentParams params) {
    return _userRepo.getLastAppointment(params);
  }

  @override
  Future<ApiResult<ResetPasswordData>> verifyPasswordOtp(
      {required OtpModel model}) {
    return _authRepo.verifyPasswordOtp(model: model);
  }

  @override
  Future<ApiResult<List<String>>> fetchLanguage() {
    return _authRepo.fetchLanguage();
  }

  @override
  Future<ApiResult<List<Map<String, dynamic>>>> fetchPincodes() {
    return _authRepo.fetchPincodes();
  }

  @override
  Future<ApiResult<Map<String, dynamic>>> registerCaretaker(
      {required SignUpCaretakerModel data}) {
    return _authRepo.registerCaretaker(data: data);
  }

  @override
  Future<ApiResult<ResetPasswordData>> verifyCaretakerOtp(
      {required OtpModel model}) {
    return _authRepo.verifyCaretakerOtp(model: model);
  }
}
