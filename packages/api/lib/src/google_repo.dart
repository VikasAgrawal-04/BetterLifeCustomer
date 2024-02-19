
import 'package:api/api.dart';
import 'package:api_client/api_result/api_result.dart';

abstract class GoogleApiRepo {
  Future<ApiResult<LocationPredictionModel>> autoComplete(
      String query, double latitude, double longitude);
}
