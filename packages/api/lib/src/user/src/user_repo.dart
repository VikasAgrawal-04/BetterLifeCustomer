import 'package:api_client/api_client.dart';

import '../../auth/src/models/reset_password_params.dart';
import 'models/models.dart';

abstract class UserRepo {
  Future<ApiResult<List<Appointment>>> getAppointments(
      {required AppointmentType type});
  Future<ApiResult<TransactionsResponseModel>> getTransactions(
      {required String id});
  Future<ApiResult<ProfileUpdateResponseModel>> updateProfile(
      {required UpdateProfileParams params});
  Future<ApiResult<String>> resetPassword(ResetPasswordParams params);
  Future<ApiResult<AppointmentResponse>> createAppointment(
    CreateAppointmentParams params,
  );
  Future<ApiResult<Appointment>> viewAppointment({
    required int appointmentId,
    required AppointmentType type,
  });
  Future<ApiResult<List<String>>> viewDiets({
    required int appointmentId,
  });
  Future<ApiResult<List<String>>> viewTests({
    required int appointmentId,
  });
  Future<ApiResult<List<String>>> viewNotes({
    required int appointmentId,
  });

  Future<ApiResult<String>> rescheduleAppointment({
    required RescheduleAppointmentParams params,
  });

  Future<ApiResult<String>> cancelAppointment({
    required int appointmendId,
  });

  Future<ApiResult<String>> serviceRating({
    required ServiceRatingParams params,
  });

  Future<ApiResult<List<String>>> viewPrescriptions({
    required int appointmentId,
  });

  Future<ApiResult<String>> selectPreviousCareTakers(
      SelectCaretakerParams params);

  Future<ApiResult<List<Caretaker>>> previousCaretaker();

  Stream<List<Appointment>> getAppointmentStream(
      {required AppointmentType type});

  Future<ApiResult<AppointmentDetails>> getLastAppointment(
      LastAppointmentParams params);
}
