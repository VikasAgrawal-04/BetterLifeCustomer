import 'package:better_life_customer/constants/api_constants.dart';
import 'package:better_life_customer/main_common.dart';

Future<void> main() async {
  await mainCommon(ApiConstants.baseUrl, ApiConstants.googleUrl);
}
