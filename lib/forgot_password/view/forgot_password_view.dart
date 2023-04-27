import 'package:better_life_customer/forgot_password/cubit/forgot_password_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();
    return Scaffold(
      appBar: const MyAppBar(),
      body: SingleChildScrollView(
        padding: kPadding,
        child: Center(
          child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
            builder: (context, state) {
              return Form(
                key: state.formKey,
                child: Column(
                  children: [
                    // Gap(70.h),
                    // SvgPicture.asset(Assets.svg.forgotPassword),
                    Gap(20.h),
                    const HeaderText(
                      text: 'Forgot Password',
                      fontSize: 30,
                      // style: context.textTheme.titleMedium,
                    ),
                    Gap(20.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Please enter mobile number to receive 4 digit OTP',
                        textAlign: TextAlign.center,
                        style: context.textTheme.titleSmall,
                      ),
                    ),
                    Gap(20.h),
                    PhoneTextField(controller: state.phone),
                    Gap(37.h),
                    MyElevatedButton(
                      // isLoading: value.isLoading,
                      text: 'Submit',
                      onPressed: cubit.forgotPassword,
                    )
                    // Consumer<ForgotPasswordCubit>(
                    //   builder: (context, value, child) => MyElevatedButton(
                    //     isLoading: value.isLoading,
                    //     text: Strings.submit,
                    //     onPressed: cubit.forgotPassword,
                    //   ),
                    // )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
