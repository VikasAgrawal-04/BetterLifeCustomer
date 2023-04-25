import 'package:better_life_customer/login/login.dart';
import 'package:better_life_customer/register/cubit/cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart';

/// {@template register_body}
/// Body of the RegisterPage.
///
/// Add what it does
/// {@endtemplate}
class RegisterBody extends StatelessWidget {
  /// {@macro register_body}
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: state.formKey,
          child: SingleChildScrollView(
            padding: kPadding,
            child: AutoSpacing(
              // padding: kPadding,
              spacing: const Gap(10),
              children: [
                const HeaderText(text: 'Hello! Register to get started.'),
                const Gap(20),
                MyTextField(
                  hintText: 'Full Name',
                  controller: state.fullName,
                  textInputAction: TextInputAction.next,
                ),
                PhoneTextField(
                  controller: state.mobile,
                ),
                EmailField(
                  controller: state.email,
                ),
                PasswordField(
                  hintText: 'Password',
                  controller: state.password,
                ),
                PasswordField(
                  hintText: 'Confirm Password',
                  controller: state.confirmPassword,
                ),
                MyTextField(
                  hintText: 'Address',
                  controller: state.adress,
                  textInputAction: TextInputAction.next,
                ),
                PincodeField(
                  hintText: 'Pin Code',
                  // inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  // textInputType: TextInputType.number,
                  // textInputAction: TextInputAction.next,
                  // validator: (value) {
                  //   if (value!.isEmpty ) {
                  //     return 'This field is required';
                  //   }
                  //   return null;
                  // },
                  controller: state.pinCode,
                ),
                MyTextField(
                  hintText: "Father's Name",
                  controller: state.fathersName,
                  textInputAction: TextInputAction.next,
                ),
                MyTextField(
                  hintText: "Mother's Name",
                  controller: state.mothersName,
                  textInputAction: TextInputAction.next,
                ),
                PhoneTextField(
                  hintText: 'Alternate Contact Number',
                  controller: state.alternateNumber,
                  textInputAction: TextInputAction.done,
                  validator: (p0) {
                    if (p0!.isNotEmpty && p0.length < 10) {
                      return 'Mobile number must be 10 digits';
                    }
                    return null;
                  },

                  // textInputAction: TextInputAction.next,
                ),

                const Gap(20),
                MyElevatedButton(
                  text: 'Register',
                  onPressed: context.read<RegisterCubit>().register,
                ),
                // const Spacer(),
                Gap(.10.sh),
                _richText(context),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _richText(BuildContext context) {
    return Center(
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account?',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey,
                  ),
            ),
            TextSpan(
              text: ' Login Now',
              recognizer: TapGestureRecognizer()
                ..onTap = () => Get.offAll<void>(
                      () => const LoginPage(),
                    ),
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: context.theme.primaryColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
