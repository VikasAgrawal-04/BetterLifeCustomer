import 'package:api/constants/endpoints.dart';
import 'package:api/src/google_repo.dart';
import 'package:api/src/user/src/models/appointment/location_prediction_model.dart';
import 'package:api_client/api_result/api_result.dart';
import 'package:api_client/api_result/network_exceptions/network_exceptions.dart';
import 'package:api_client/configs/client.dart';

class GoogleApiRepoImpl implements GoogleApiRepo {
  final Client client;
  GoogleApiRepoImpl({required this.client});

  @override
  Future<ApiResult<LocationPredictionModel>> autoComplete(
      String query, double latitude, double longitude) async {
    try {
      final result = await client.get(Endpoints.autoComplete, queryParameters: {
        'input': query,
        'key': Endpoints.gKey,
        'radius': 100,
        'location': '$latitude,$longitude',
        'origin': '$latitude,$longitude'
      });
      return ApiResult.success(
          data: LocationPredictionModel.fromJson(result.data));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
