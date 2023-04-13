import 'package:api/api.dart';
import 'package:api_client/configs/client.dart';
import 'package:better_life_customer/app/view/app.dart';
import 'package:better_life_customer/bootstrap.dart';
import 'package:hive_storage/hive_storage.dart';

Future<void> mainCommon(String baseUrl) async {
  await Hive.initFlutter();
  final client = Client(
    baseUrl: baseUrl,
  );
  final storage = await Hive.openBox<void>('storage');

  final ApiRepo api = ApiRepoImpl(
    client: client,
    box: storage,
  );

  await bootstrap(() => App(apiRepo: api));
}
