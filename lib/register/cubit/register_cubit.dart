import 'dart:async';

import 'package:api/api.dart';
import 'package:api_client/api_result/network_exceptions/network_exceptions.dart';
import 'package:better_life_customer/login/login.dart';
import 'package:better_life_customer/otp/view/otp_page.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.api) : super(RegisterState.initial());
  final ApiRepo api;

  Future<void> register() async {
    if (!state.formKey.currentState!.validate()) {
      return;
    }

    if (state.password.text != state.confirmPassword.text) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    final result = await api.signUp(
      data: SignUpModel(
        confirmPassword: state.confirmPassword.text,
        email: state.email.text,
        fullName: state.fullName.text,
        password: state.password.text,
        phoneNumber: int.parse(state.mobile.text),
        address: state.adress.text,
        alternateNumber: state.alternateNumber.text,
        fathersName: state.fathersName.text,
        mothersName: state.mothersName.text,
        pincode: state.pinCode.text,
        firebaseDeviceToken: 'asfasefd',
      ),
    );
    result.when(success: success, failure: failure);
  }

  Object? failure(NetworkExceptions error) {
    DialogService.failure(error);
    return null;
  }

  Future<void> success(SignupResponseModel data) async {
    Future<void>? onTap() => Get.to<void>(
          OtpPage(
            contactNumber: state.mobile.text,
          ),
        );
    await DialogService.showDialog<void>(
      child: MailSentDialog(
        message: data.message,
        onContinue: onTap,
      ),
    );

    // DialogService.success(
    //   data.message,

    //   onTap: () => Get.to<void>(
    //     OtpPage(
    //       contactNumber: state.mobile.text,
    //     ),
    //   ),
    // );
    // return null;
  }
}
