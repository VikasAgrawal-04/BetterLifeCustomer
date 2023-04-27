// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api/constants/endpoints.dart';
import 'package:api/src/auth/src/storage/storage_service.dart';
import 'package:api_client/api_client.dart';
import 'package:api_client/configs/client.dart';
import 'package:rxdart/subjects.dart';

import '../../auth/src/models/reset_password_params.dart';
import 'models/models.dart';
import 'user_repo.dart';

class UserRepoImpl implements UserRepo {
  final Client client;
  final StorageService storage;

  UserRepoImpl({
    required this.client,
    required this.storage,
  });

  final BehaviorSubject<List<Appointment>> _pastAppointments =
      BehaviorSubject<List<Appointment>>.seeded([]);
  final BehaviorSubject<List<Appointment>> _presentAppointments =
      BehaviorSubject<List<Appointment>>.seeded([]);
  final BehaviorSubject<List<Appointment>> _futureAppointments =
      BehaviorSubject<List<Appointment>>.seeded([]);

  @override
  Future<ApiResult<List<Appointment>>> getAppointments({
    required AppointmentType type,
  }) async {
    try {
      final endpoint = {
        AppointmentType.present: Endpoints.presentAppointments,
        AppointmentType.past: Endpoints.pastAppointments,
        AppointmentType.future: Endpoints.futureAppointments,
      };
      final result = await client.post(endpoint[type]!);
      final model = AppointmentResponseModel.fromJson(result.data);
      switch (type) {
        case AppointmentType.present:
          _presentAppointments.add(model.data ?? []);
          break;
        case AppointmentType.past:
          _pastAppointments.add(model.data ?? []);
          break;
        case AppointmentType.future:
          _futureAppointments.add(model.data ?? []);
          break;
      }
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
  Future<ApiResult<String>> resetPassword(ResetPasswordParams params) async {
    try {
      final result =
          await client.post(Endpoints.resetPassword, data: params.toJson());
      final message = result.data['message'];
      return ApiResult.success(data: message);
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
  Future<ApiResult<AppointmentResponse>> createAppointment(
    CreateAppointmentParams params,
  ) async {
    try {
      final result = await client.post(
        Endpoints.createNewAppointment,
        queryParameters: params.toJson(),
      );
      final parser = ApiResultParser.parse(data: result.data);

      if (parser.hasError) {
        return ApiResult.failure(error: parser.failure);
      }

      final response = AppointmentResponse(
        id: result.data['data']['appointmentId'],
        message: result.data['message'],
      );

      return ApiResult.success(data: response);
    } catch (e) {
      if (e is DioError) {
        return ApiResult.failure(
          error: NetworkExceptions.defaultError(_parseError(e.response?.data)),
        );
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
  Future<ApiResult<List<String>>> viewPrescriptions({
    required int appointmentId,
  }) async {
    final result = await client.post(
      Endpoints.viewPrescriptions,
      queryParameters: {'appointmentId': appointmentId},
    );

    final ApiResultParser parser = ApiResultParser.parse(
      data: result.data,
    );

    if (parser.hasError) {
      return ApiResult.failure(error: parser.failure);
    }
    final prescriptions = parser.success['data'] as List;
    final List<String> data = prescriptions
        .map((e) => e['filename'] as String)
        .toList(growable: false);
    return ApiResult.success(data: data);
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

  @override
  Future<ApiResult<String>> cancelAppointment({
    required int appointmendId,
  }) async {
    try {
      final result = await client.post(
        Endpoints.cancelAppointment,
        queryParameters: {'appointmentId': appointmendId},
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

  @override
  Future<ApiResult<String>> serviceRating({
    required ServiceRatingParams params,
  }) async {
    try {
      final result = await client.post(
        Endpoints.serviceRatingCaretaker,
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

  @override
  Future<ApiResult<List<Caretaker>>> previousCaretaker() async {
    final result = await client.post(Endpoints.previousCaretakers);
    final ApiResultParser parser = ApiResultParser.parse(data: result.data);
    if (parser.hasError) return ApiResult.failure(error: parser.failure);
    final List data = parser.success['data'] as List;
    return ApiResult.success(
      data: data.map((e) => Caretaker.fromJson(e)).toList(),
    );
  }

  @override
  Future<ApiResult<String>> selectPreviousCareTakers(
      SelectCaretakerParams params) async {
    final result = await client.post(
      Endpoints.selectPreviousCareTakers,
      data: params.toJson(),
    );
    final ApiResultParser parser = ApiResultParser.parse(data: result.data);
    if (parser.hasError) return ApiResult.failure(error: parser.failure);
    final String data = parser.success['message'] as String;
    return ApiResult.success(data: data);
  }

  @override
  Future<ApiResult<AppointmentDetails>> getLastAppointment(
      LastAppointmentParams params) async {
    final result = await client.post(
      Endpoints.getLastAppointment,
      data: params.toJson(),
    );
    final ApiResultParser parser = ApiResultParser.parse(data: result.data);
    if (parser.hasError) return ApiResult.failure(error: parser.failure);
    final data = AppointmentDetails.fromJson(parser.success['data']);
    return ApiResult.success(data: data);
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

  @override
  Stream<List<Appointment>> getAppointmentStream({
    required AppointmentType type,
  }) {
    switch (type) {
      case AppointmentType.future:
        return _futureAppointments.stream;
      case AppointmentType.past:
        return _pastAppointments.stream;
      case AppointmentType.present:
        return _presentAppointments.stream;
      default:
        return _presentAppointments.stream;
    }
  }
}
