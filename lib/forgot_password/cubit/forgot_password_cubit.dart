import 'package:api/api.dart';
import 'package:api_client/api_result/network_exceptions/network_exceptions.dart';
import 'package:better_life_customer/otp/view/otp_page.dart';
import 'package:better_life_customer/reset_password/reset_password.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit(this.api)
      : super(
          ForgotPasswordState(
            formKey: GlobalKey<FormState>(),
            phone: TextEditingController(),
          ),
        );
  final ApiRepo api;

  // final formKey = GlobalKey<FormState>();
  // final phoneController = TextEditingController();

  Future<void> forgotPassword() async {
    if (state.formKey.currentState!.validate()) {
      // setLoading(true);
      final result = await api.sendOtp(number: state.phone.text);
      result.when(success: _onSuccess, failure: _onFailure);
      // setLoading(false);
    }
  }

  Object? _onFailure(NetworkExceptions error) {
    DialogService.failure(error);
    return null;
  }

  Future<void> _onSuccess(ResponseModel data) async {
    final result = await Get.to<ResetPasswordData>(
      () => OtpPage(
        contactNumber: state.phone.text,
        fromForgotPassword: true,
      ),
    );
    if (result == null) {
      DialogService.error('Something went wrong');
      return;
    }
    await Get.offAll<void>(
      () => ResetPasswordPage(mobileNumber: result.contactNumber),
    );
  }
}
