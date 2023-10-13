import 'package:better_life_customer/forgot_password/view/forgot_password_page.dart';
import 'package:better_life_customer/login/cubit/cubit.dart';
import 'package:better_life_customer/register/view/register_caretaker_page.dart';
import 'package:better_life_customer/register/view/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_theme/my_theme.dart';
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
                children: [
                  SizedBox.square(
                    dimension: 100,
                    child: Transform.scale(
                      scale: 1.2,
                      child: SvgPicture.asset(
                        'assets/logo_svg.svg',
                      ),
                    ),
                  ),
                  const HeaderText(
                    text: 'Welcome to Better Life',
                  ),
                  const SizedBox(height: 20),
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
                  Align(
                    alignment: Alignment.centerRight,
                    child: _forgotPassword(),
                  ),
                  const SizedBox(height: 20),
                  MyElevatedButton(
                    text: 'Login',
                    onPressed: context.read<LoginCubit>().login,
                  ),
                  const SizedBox(height: 20),
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

  Widget _dontHaveAnAccount(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(
              child: Container(
                  height: 1,
                  margin: const EdgeInsets.only(right: 15),
                  color: Colors.grey.shade500)),
          const Text('New to the app?'),
          Expanded(
              child: Container(
                  height: 1,
                  margin: const EdgeInsets.only(left: 15),
                  color: Colors.grey.shade500))
        ],
      ),
      const SizedBox(height: 10),
      MyElevatedButton(
          onPressed: () async => Get.offAll<void>(
                () => const RegisterPage(),
              ),
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade500),
          child: Text(
            'Register as normal user',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: Colors.blue, fontWeight: FontWeight.w500),
          )),
      const SizedBox(height: 10),
      MyElevatedButton(
        onPressed: () async =>
            Get.to<void>(() => const RegisterCaretakerPage()),
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade500),
        child: Text(
          'Register as caretaker',
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: Colors.blue, fontWeight: FontWeight.w500),
        ),
      ),
    ]);
  }

  TextButton _forgotPassword() {
    return TextButton(
      onPressed: () => Get.to<void>(const ForgotPasswordPage()),
      style: TextButton.styleFrom(
        foregroundColor: kPrimaryColor,
        alignment: Alignment.centerRight,
      ),
      child: const Text(
        'Forgot Password?',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
    );
  }
}
