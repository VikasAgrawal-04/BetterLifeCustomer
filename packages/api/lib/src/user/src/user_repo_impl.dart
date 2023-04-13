import 'package:api/constants/endpoints.dart';
import 'package:api/src/auth/src/models/user.dart';
import 'package:api/src/auth/src/storage/storage_service.dart';
import 'package:api_client/api_client.dart';
import 'package:api_client/configs/client.dart';

import '../../auth/src/models/reset_password_params.dart';
import 'models/models.dart';
import 'user_repo.dart';

class UserRepoImpl implements UserRepo {
  final Client client;
  final StorageService storage;

  UserRepoImpl({required this.storage, required this.client});

  @override
  Future<ApiResult<List<Appointment>>> getAppointments(
      {required AppointmentType type}) async {
    try {
      final endpoint = {
        AppointmentType.present: Endpoints.presentAppointments,
        AppointmentType.past: Endpoints.pastAppointments,
        AppointmentType.future: Endpoints.futureAppointments,
      };
      final result = await client.post(endpoint[type]!);
      final AppointmentResponseModel model =
          AppointmentResponseModel.fromJson(result.data);

      return ApiResult.success(data: model.data ?? []);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<TransactionsResponseModel>> getTransactions(
      {required String id}) async {
    try {
      final result = await client.post(Endpoints.showTransactionHistory);
      final model = TransactionsResponseModel.fromJson(result.data);
      return ApiResult.success(data: model);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<ProfileUpdateResponseModel>> updateProfile(
      {required UpdateProfileParams params}) async {
    try {
      final result = await client.put(
        '${Endpoints.showProfile}/${params.id}',
        data: params.toJson(),
      );
      final model = ProfileUpdateResponseModel.fromJson(result.data);
      storage.setUser(model.user.toJson());
      return ApiResult.success(data: model);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<User>> resetPassword(ResetPasswordParams params) async {
    try {
      final result =
          await client.put(Endpoints.changeUserPassword, data: params.toJson());
      final model = User.fromJson(result.data['user']);
      storage.setUser(model.toJson());
      return ApiResult.success(data: model);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<Appointment>> viewAppointment({
    required int appointmentId,
    required AppointmentType type,
  }) async {
    try {
      final endpoint = {
        AppointmentType.past: Endpoints.viewPastAppointment,
        AppointmentType.future: Endpoints.viewFutureAppointment,
      };
      final result = await client.post(
        endpoint[type]!,
        queryParameters: {'appointmentId': appointmentId},
      );
      if (result.data['status'] == false) {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(_parseError(result.data)));
      }

      final Appointment message = Appointment.fromJson(result.data['data']);

      return ApiResult.success(data: message);
    } catch (e) {
      if (e is DioError) {
        return ApiResult.failure(
            error:
                NetworkExceptions.defaultError(_parseError(e.response?.data)));
      }
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<String>> createAppointment(
    CreateAppointmentParams params,
  ) async {
    try {
      final result = await client.post(
        Endpoints.createNewAppointment,
        queryParameters: params.toJson(),
      );
      if (result.data['status'] == false) {
        return ApiResult.failure(
            error: NetworkExceptions.defaultError(_parseError(result.data)));
      }

      final String message = result.data['message'];

      return ApiResult.success(data: message);
    } catch (e) {
      if (e is DioError) {
        return ApiResult.failure(
            error:
                NetworkExceptions.defaultError(_parseError(e.response?.data)));
      }
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<List<String>>> viewDiets({
    required int appointmentId,
  }) async {
    try {
      final result = await client.post(
        Endpoints.viewDiets,
        queryParameters: {'appointmentId': appointmentId},
      );

      if (result.data['status'] == false) {
        return ApiResult.failure(
          error: NetworkExceptions.defaultError(
            _parseError(result.data),
          ),
        );
      }

      final List message = result.data['data'] as List;

      return ApiResult.success(
        data: message.map((e) => e['filename'] as String).toList(),
      );
    } catch (e) {
      if (e is DioError) {
        return ApiResult.failure(
          error: NetworkExceptions.defaultError(
            _parseError(e.response?.data),
          ),
        );
      }
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<List<String>>> viewNotes({
    required int appointmentId,
  }) async {
    try {
      final result = await client.post(
        Endpoints.viewNotes,
        queryParameters: {'appointmentId': appointmentId},
      );

      if (result.data['status'] == false) {
        return ApiResult.failure(
          error: NetworkExceptions.defaultError(
            _parseError(result.data),
          ),
        );
      }

      final List message = result.data['data'] as List;

      return ApiResult.success(
        data: message.map((e) => e['filename'] as String).toList(),
      );
    } catch (e) {
      if (e is DioError) {
        return ApiResult.failure(
          error: NetworkExceptions.defaultError(
            _parseError(e.response?.data),
          ),
        );
      }
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<List<String>>> viewTests({
    required int appointmentId,
  }) async {
    try {
      final result = await client.post(
        Endpoints.viewTests,
        queryParameters: {'appointmentId': appointmentId},
      );

      if (result.data['status'] == false) {
        return ApiResult.failure(
          error: NetworkExceptions.defaultError(
            _parseError(result.data),
          ),
        );
      }

      final List message = result.data['data'] as List;

      return ApiResult.success(
        data: message.map((e) => e['filename'] as String).toList(),
      );
    } catch (e) {
      if (e is DioError) {
        return ApiResult.failure(
          error: NetworkExceptions.defaultError(
            _parseError(e.response?.data),
          ),
        );
      }
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult<String>> rescheduleAppointment({
    required RescheduleAppointmentParams params,
  }) async {
    try {
      final result = await client.post(
        Endpoints.rescheduleAppointment,
        queryParameters: params.toJson(),
      );

      if (result.data['code'] == '404') {
        return ApiResult.failure(
          error: NetworkExceptions.defaultError(
            (result.data['message']),
          ),
        );
      }
      if (result.data['status'] == false) {
        return ApiResult.failure(
          error: NetworkExceptions.defaultError(
            _parseError(result.data),
          ),
        );
      }

      final String message = result.data['message'] as String;

      return ApiResult.success(
        data: message,
      );
    } catch (e) {
      if (e is DioError) {
        return ApiResult.failure(
          error: NetworkExceptions.defaultError(
            _parseError(e.response?.data),
          ),
        );
      }
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  String _parseError(Map? data) {
    String error = 'Something went wrong';
    if (data?.isEmpty ?? true) return error;
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
}
