import 'package:api/api.dart';
import 'package:api_client/configs/client.dart';
import 'package:better_life_customer/app/view/app.dart';
import 'package:better_life_customer/bootstrap.dart';
import 'package:better_life_customer/register/view/controller/caretaker_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_storage/hive_storage.dart';
import 'package:notifications/notifications.dart';
import 'package:widgets/widgets.dart';

Future<void> bgHandler(RemoteMessage message) async {
  final pushNotification = PushNotificationService();
  await pushNotification.handleMessage(message);
}

Future<void> mainCommon(String baseUrl) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final pns = PushNotificationService();
  await pns.init();
  FirebaseMessaging.onBackgroundMessage(bgHandler);

  await Hive.initFlutter();
  final client = Client(
    baseUrl: baseUrl,
  );
  final storage = await Hive.openBox<void>('storage');

  final ApiRepo api = ApiRepoImpl(
    client: client,
    box: storage,
  );
  Get.put(CaretakerController(api));

  await bootstrap(() => App(apiRepo: api));
}
