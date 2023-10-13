// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api/api.dart';
import 'package:api_client/api_client.dart';
import 'package:better_life_customer/login/login.dart';
import 'package:better_life_customer/otp/cubit/otp_state.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class OtpCubit extends Cubit<OtpState> {
  final bool fromForgotPassword;
  OtpCubit(
    this.fromForgotPassword,
    this.authRepo,
    this.contactNumber,
  ) : super(OtpState(otp: TextEditingController()));
  final AuthRepo authRepo;
  final String contactNumber;

  void onTimeout() {
    emit(state.copyWith(isLoading: false, showCountdown: false));
  }

  // void onOtpChange(String v) {
  //   emit(state.copyWith(otp: v));
  // }

  Future<void> verityOtp() async {
    var error = '';
    if (state.otp.text.length < 4) {
      error = 'Please enter valid otp';
    } else {
      error = '';
    }

    if (error.isNotEmpty) {
      DialogService.failure(
        const NetworkExceptions.defaultError('Please enter valid otp'),
      );
      return;
    }

    final model = OtpModel(mobileNumber: contactNumber, otp: state.otp.text);
    final result = !fromForgotPassword
        ? authRepo.verifyOtp(model: model)
        : authRepo.verifyPasswordOtp(model: model);
    (await result).when(
      success: (data) => fromForgotPassword
          ? Get.back<ResetPasswordData>(result: data)
          : _onSuccess(data),
      failure: _onFailure,
    );
  }

  Future<void> resendOtp() async {
    final result = await authRepo.sendOtp(number: contactNumber);
    result.when(
      success: (dat) => Get.snackbar('Success', 'Otp sent successfully'),
      failure: DialogService.failure,
    );
  }

  void _onFailure(NetworkExceptions e) {
    DialogService.failure(e);
  }

  void _onSuccess(ResetPasswordData data) {
    DialogService.showDialog<void>(
      child: MailSentDialog(
        message: data.message ?? '',
        onContinue: () async {
          await Get.offAll<void>(
            LoginPage.new,
          );
        },
      ),
    );
  }

  void _onRetrySuccess(data) {
    // DialogService.showDialog(
    //   child: MailSentDialog(
    //     message: data.message!,
    //     onContinue: () async {
    //       Get.back();
    //     },
    //   ),
    // );
  }

  void _onRetryFailure(NetworkExceptions error) {
    // _onFailure(error);
  }
}
