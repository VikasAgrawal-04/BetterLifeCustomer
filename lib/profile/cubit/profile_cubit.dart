import 'dart:async';

import 'package:api/api.dart';
import 'package:better_life_customer/login/view/login_page.dart';
import 'package:better_life_customer/reset_password/view/reset_password_page.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this.api)
      : super(
          ProfileState(
            name: TextEditingController(text: api.getUser()?.fullName),
            email: TextEditingController(text: api.getUser()?.email),
            phone: TextEditingController(text: api.getUser()?.mobile),
          ),
        );
  final ApiRepo api;

  Future<void> updateProfile() async {
    // final params = UpdateProfileParams(
    //   name: state.name.text,
    //   email: state.email.text,
    //   // mobile: state.phone.text,
    //   id: api.getUser()!.customerId!.toString(),
    // );
    // final result = await api.updateProfile(params: params);
    // result.when(
    //   success: (data) {
    //     DialogService.success(
    //       data.message,
    //       onTap: () {
    //         Get.back<void>();
    //       },
    //     );
    //   },
    //   failure: (error) {
    //     DialogService.failure(error);
    //   },
    // );
  }

  Future<void> logout() async {
    await api.logout();
    await Get.offAll<void>(() => const LoginPage());
  }

  void goToResetPassword() {
    Get.to<void>(() => const ResetPasswordPage());
  }
}
