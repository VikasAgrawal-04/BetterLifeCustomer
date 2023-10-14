import 'package:api/api.dart';
import 'package:api_client/api_client.dart';
import 'package:better_life_customer/login/login.dart';
import 'package:better_life_customer/otp/cubit/otp_state.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit(
    this.fromForgotPassword,
    this.authRepo,
    this.contactNumber, {
    this.careTaker = false,
  }) : super(OtpState(otp: TextEditingController()));
  final bool fromForgotPassword;
  final bool careTaker;
  final AuthRepo authRepo;
  final String contactNumber;

  void onTimeout() {
    emit(state.copyWith(isLoading: false, showCountdown: false));
  }

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
    final result = careTaker == true
        ? authRepo.verifyCaretakerOtp(model: model)
        : !fromForgotPassword
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

}
