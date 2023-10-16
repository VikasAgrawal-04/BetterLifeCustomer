import 'package:api/src/auth/src/auth_repo.dart';
import 'package:api/src/caretaker/caretaker_repo.dart';

import 'user/user_repo.dart';

abstract class ApiRepo implements AuthRepo, UserRepo, CaretakerRepo {}
