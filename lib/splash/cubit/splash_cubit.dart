import 'dart:async';

import 'package:api/api.dart';
import 'package:better_life_customer/login/login.dart';
import 'package:equatable/equatable.dart';
import 'package:widgets/widgets.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit(this.api) : super(const SplashInitial()) {
    init();
  }
  final ApiRepo api;

  Future<void> getStarted() async {
    await Get.off<void>(() => const LoginPage());
  }

  bool get isLoggedIn => api.isLoggedIn;

  Future<void> init() async {
    // emit(state.copyWith(isLoggedIn: api.isLoggedIn));
    // await Future<void>.delayed(const Duration(seconds: 1));
    // if (api.isLoggedIn) {
    //   await Get.offAll<void>(() => const HomePage());
    // }
  }
}
