import 'package:api/src/auth/src/storage/storage_service.dart';
import 'package:api/src/caretaker/caretaker_repo.dart';
import 'package:api_client/configs/client.dart';

class CaretakerRepoImpl implements CaretakerRepo {
  final Client client;
  final StorageService storage;

  CaretakerRepoImpl({
    required this.client,
    required this.storage,
  });
}
