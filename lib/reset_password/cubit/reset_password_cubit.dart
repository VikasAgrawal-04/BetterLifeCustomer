import 'dart:async';

import 'package:api/api.dart';
import 'package:better_life_customer/login/view/login_page.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.api, this.mobileNumber)
      : super(ResetPasswordState.initial());
  final String? mobileNumber;
  final ApiRepo api;

  /// A description for yourCustomFunction
  Future<void> resetPassword() async {
    try {
      if (!(state.formKey.currentState?.validate() ?? false)) {
        return;
      }

      final isSamePasswords = state.password.text == state.confirmPassword.text;
      if (!isSamePasswords) {
        DialogService.error('Passwords do not match');
        return;
      }

      final reset = ResetPasswordParams(
        // mobile: mobileNumber ?? api.getUser()!.mobile!,
        password: state.password.text,
        passwordConfirmation: state.confirmPassword.text,
      );

      final result = await api.resetPassword(reset);
      result.when(success: success, failure: DialogService.failure);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void success(String data) {
    DialogService.success(
      data,
      onTap: () => Get.offAll<void>(() => const LoginPage()),
    );
  }
}
