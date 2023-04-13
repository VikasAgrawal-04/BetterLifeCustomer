import 'package:better_life_customer/reset_password/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart';

/// {@template reset_password_body}
/// Body of the ResetPasswordPage.
///
/// Add what it does
/// {@endtemplate}
class ResetPasswordBody extends StatelessWidget {
  /// {@macro reset_password_body}
  const ResetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        return SingleChildScrollView(
          padding: kPadding,
          child: Form(
            key: state.formKey,
            child: Column(
              children: [
                const Gap(20),
                MyTextField(
                  hintText: 'New Password',
                  controller: state.password,
                  obscureText: true,
                ),
                const Gap(15),
                MyTextField(
                  hintText: 'Confirm Password',
                  controller: state.confirmPassword,
                  obscureText: true,
                ),
                const Gap(15),
                MyElevatedButton(
                  text: 'Reset Password',
                  onPressed: context.read<ResetPasswordCubit>().resetPassword,
                ),
                const Gap(15),
              ],
            ),
          ),
        );
      },
    );
  }
}
