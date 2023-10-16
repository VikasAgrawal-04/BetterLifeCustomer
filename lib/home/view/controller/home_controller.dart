import 'package:api/api.dart';
import 'package:widgets/widgets.dart';

class HomeController extends GetxController {
  HomeController(this.api);
  final ApiRepo api;

  RxInt selectedIndex = 0.obs;
}
