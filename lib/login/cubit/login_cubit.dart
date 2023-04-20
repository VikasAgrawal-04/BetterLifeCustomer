import 'dart:async';

import 'package:api/api.dart';
import 'package:api_client/api_result/network_exceptions/network_exceptions.dart';
import 'package:better_life_customer/home/view/home_page.dart';
import 'package:better_life_customer/otp/view/otp_page.dart';
import 'package:better_life_customer/register/register.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.api) : super(LoginState.initial());
  final ApiRepo api;

  Future<void> login() async {
    final isValidate = state.formKey.currentState!.validate();
    if (!isValidate) {
      return;
    }
    final result = await api.signIn(
      data: LoginParams(
        mobile: int.parse(state.mobile.text),
        password: state.password.text,
      ),
    );

    await result.when(success: success, failure: failure);
  }

  Future<void> failure(NetworkExceptions error) async {
    DialogService.failure(error);
    return;
  }

  Future<void> success(SignInResponse data) async {
    if (data.isOtpVerified) {
      await Get.offAll<void>(() => const HomePage());
    } else {
      final result = await api.sendOtp(number: state.mobile.text);
      await result.when(
        success: (data) async {
          await Get.offAll<bool>(
            () => OtpPage(
              contactNumber: state.mobile.text,
            ),
          );
        },
        failure: failure,
      );
    }
  }
}
