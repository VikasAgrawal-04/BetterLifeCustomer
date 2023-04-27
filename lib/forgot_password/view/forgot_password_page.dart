import 'package:api/api.dart';
import 'package:better_life_customer/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:better_life_customer/forgot_password/view/forgot_password_view.dart';
import 'package:better_life_customer/home/home.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgotPasswordCubit>(
      create: (context) => ForgotPasswordCubit(context.read<ApiRepo>()),
      child: const ForgotPasswordView(),
    );
  }
}
