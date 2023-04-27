import 'package:api/api.dart';
import 'package:better_life_customer/reset_password/cubit/cubit.dart';
import 'package:better_life_customer/reset_password/widgets/reset_password_body.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

/// {@template reset_password_page}
/// A description for ResetPasswordPage
/// {@endtemplate}
class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key, this.mobileNumber});
  final String? mobileNumber;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResetPasswordCubit(
        context.read<ApiRepo>(),
        mobileNumber,
      ),
      child: Scaffold(
        appBar: MyAppBar(
          title: const Text('Reset Password'),
          backgroundColor: context.theme.primaryColor,
          showBackButton: false,
        ),
        body: const ResetPasswordView(),
      ),
    );
  }
}

/// {@template reset_password_view}
/// Displays the Body of ResetPasswordView
/// {@endtemplate}
class ResetPasswordView extends StatelessWidget {
  /// {@macro reset_password_view}
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResetPasswordBody();
  }
}
