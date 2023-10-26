import 'package:api/src/caretaker/src/models/appointment/care_appointment.dart';
import 'package:api/src/caretaker/src/models/appointment/care_appointment_details.dart';
import 'package:api/src/user/src/models/models.dart';
import 'package:api_client/api_client.dart';

abstract class CaretakerRepo {
  Future<ApiResult<List<CareAppointment>>> getNewAppointment();
  Future<ApiResult<List<CareAppointment>>> getCareAppointment(
      {required AppointmentType type});
  Future<ApiResult<Map<String, dynamic>>> appointmentAction(
      {required bool accept, required int aptId});

  Future<ApiResult<CareAppointmentDetails>> getApptDetails(int apptId);
}
