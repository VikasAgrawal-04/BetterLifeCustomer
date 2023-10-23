import 'package:api/constants/endpoints.dart';
import 'package:api/src/auth/src/storage/storage_service.dart';
import 'package:api/src/caretaker/src/caretaker_repo.dart';
import 'package:api/src/caretaker/src/models/appointment/care_appointment.dart';
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
      {required AppointmentType type}) {
    // TODO: implement getCareAppointment
    throw UnimplementedError();
  }

  @override
  Future<ApiResult<Map<String, dynamic>>> appointmentAction(
      {required bool accept, required int aptId}) async {
    try {
      final endpoint = {
        true: Endpoints.acceptAppointment,
        false: Endpoints.rejectAppointment
      };
      print(endpoint[accept]);
      final result =
          await client.put(endpoint[accept]!, queryParameters: {'apptid': aptId});
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
