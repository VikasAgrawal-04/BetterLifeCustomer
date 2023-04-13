import 'dart:async';

import 'package:api/api.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit(this.api) : super(ResetPasswordState.initial());
  final ApiRepo api;

  /// A description for yourCustomFunction
  Future<void> resetPassword() async {
    if (!(state.formKey.currentState?.validate() ?? false)) {
      return;
    }

    final isSamePasswords = state.password.text == state.confirmPassword.text;
    if (!isSamePasswords) {
      DialogService.error('Passwords do not match');
      return;
    }

    final reset = ResetPasswordParams(
      mobile: api.getUser()!.mobile!,
      password: state.password.text,
      passwordConfirmation: state.confirmPassword.text,
    );

    final result = await api.resetPassword(reset);
    result.when(success: success, failure: DialogService.failure);
  }

  void success(User data) {
    DialogService.success(
      'Password reset successfully',
      onTap: () => Get.close(2),
    );
  }
}
