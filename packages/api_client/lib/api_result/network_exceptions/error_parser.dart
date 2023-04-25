// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api_client/api_client.dart';

typedef ParseSuccess = ApiResult<Success> Function(ApiResult<Map> data);
typedef ParseFailure = ApiResult<Failure> Function(ApiResult<Failure> error);

class ApiResultParser<T> {
  final NetworkExceptions failure;
  final Map success;
  final bool hasError;
  ApiResultParser({
    required this.failure,
    required this.success,
    required this.hasError,
  });
  static ApiResultParser parse({
    required Map? data,
  }) {
    if (data?['code'] == '404' || data?['status'] == false) {
      return ApiResultParser(
        failure: NetworkExceptions.defaultError(
          _parseError(data),
        ),
        success: data!,
        hasError: true,
      );
    }

    return ApiResultParser(
      failure: NetworkExceptions.defaultError(
        _parseError(data),
      ),
      success: data!,
      hasError: false,
    );
  }

  static String _parseError(Map? data) {
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
    } else {
      if (data.containsKey('message')) {
        error = data['message'];
      }
    }
    return error;
  }
}
