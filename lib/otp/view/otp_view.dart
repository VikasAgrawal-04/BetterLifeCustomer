import 'package:better_life_customer/otp/cubit/otp_cubit.dart';
import 'package:better_life_customer/otp/cubit/otp_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_theme/my_theme.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:widgets/widgets.dart';

class OtpView extends StatelessWidget {
  const OtpView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OtpCubit>();
    return Scaffold(
      body: SingleChildScrollView(
        padding: kPadding,
        child: Column(
          children: [
            Gap(70.h),
            // SvgPicture.asset(Assets.svg.otp),
            Gap(50.h),
            Text(
              'Enter OTP',
              style: context.textTheme.bodyMedium?.copyWith(
                color: context.theme.primaryColor,
                fontSize: 26.sp,
              ),
            ),
            Gap(20.h),
            Text(
              'OTP sent to mobile',
              textAlign: TextAlign.center,
              style: context.textTheme.bodyMedium?.copyWith(
                fontSize: 12.sp,
              ),
            ),
            Gap(5.h),
            Text(
              context.read<OtpCubit>().contactNumber,
              textAlign: TextAlign.center,
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 12.sp,
              ),
            ),
            Gap(58.h),
            SizedBox(
              child: BlocBuilder<OtpCubit, OtpState>(
                builder: (context, state) {
                  return PinCodeTextField(
                    controller: state.otp,
                    wrapAlignment: WrapAlignment.spaceBetween,
                    pinBoxOuterPadding:
                        const EdgeInsets.symmetric(horizontal: 10),
                    highlightColor: context.theme.primaryColor,
                    onDone: (text) {
                      cubit.verityOtp();
                    },
                    pinBoxHeight: 50,
                    pinBoxWidth: 50,
                    defaultBorderColor: kLightGrey,
                    pinBoxColor: kLightGrey,
                    hasTextBorderColor: kLightGrey,
                    pinBoxRadius: kBorderRadius.topLeft.x,
                    highlight: true,
                  );
                },
              ),
            ),
            Gap(32.h),
            MyElevatedButton(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              onPressed: cubit.verityOtp,
              text: 'Verify',
            ),
            Gap(20.h),
            LoadingSwitcher(
              onPressed: cubit.resendOtp,
              child: Text(
                'Resend OTP',
                textAlign: TextAlign.center,
                style: context.textTheme.bodySmall?.copyWith(
                  color: context.theme.primaryColor,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
