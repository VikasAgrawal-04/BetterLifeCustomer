import 'package:api/src/auth/src/auth_repo.dart';

import 'user/user_repo.dart';

abstract class ApiRepo implements AuthRepo, UserRepo {}
