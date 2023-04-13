import 'package:better_life_customer/login/cubit/cubit.dart';
import 'package:better_life_customer/register/view/register_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart';

/// {@template login_body}
/// Body of the LoginPage.
///
/// Add what it does
/// {@endtemplate}
class LoginBody extends StatelessWidget {
  /// {@macro login_body}
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            padding: kPadding,
            child: Form(
              key: state.formKey,
              child: Column(
                // padding: kPadding,
                children: [
                  SizedBox.square(
                    dimension: 200,
                    child: Transform.scale(
                      scale: 1.8,
                      child: Image.asset(
                        'assets/logo.png',
                      ),
                    ),
                  ),
                  const HeaderText(
                    text: 'Welcome to Better Life',
                  ),
                  const SizedBox(height: 50),
                  PhoneTextField(
                    controller: state.mobile,
                    hidePrefixIcon: false,
                  ),
                  const SizedBox(height: 20),
                  PasswordField(
                    controller: state.password,
                    textInputAction: TextInputAction.search,
                    hidePrefixIcon: false,
                    onSubmitted: (p0) => context.read<LoginCubit>().login(),
                  ),
                  // Align(
                  //   alignment: Alignment.centerRight,
                  //   child: _forgotPassword(),
                  // ),
                  const SizedBox(height: 20),
                  MyElevatedButton(
                    text: 'Login',
                    onPressed: context.read<LoginCubit>().login,
                  ),
                  const SizedBox(height: 20),
                  // const Spacer(),
                  _dontHaveAnAccount(context),
                  const Gap(10),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  RichText _dontHaveAnAccount(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          const TextSpan(
            text: "Don't have an account?",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: Colors.grey,
            ),
          ),
          TextSpan(
            text: ' Register Now',
            recognizer: TapGestureRecognizer()
              ..onTap = () => Get.offAll<void>(
                    () => const RegisterPage(),
                  ),
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: context.theme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  TextButton _forgotPassword() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        foregroundColor: Colors.grey.shade900,
        alignment: Alignment.centerRight,
      ),
      child: Text(
        'Forgot Password?',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.grey.shade500,
        ),
      ),
    );
  }
}
