import 'package:api/api.dart';
import 'package:better_life_customer/otp/cubit/otp_cubit.dart';
import 'package:better_life_customer/otp/view/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpPage extends StatelessWidget {
  const OtpPage({
    required this.contactNumber, required this.fromForgotPassword, super.key,
  });
  final String contactNumber;
  final bool fromForgotPassword;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OtpCubit(
        fromForgotPassword,
        context.read<ApiRepo>(),
        contactNumber,
      ),
      child: const OtpView(),
    );
  }
}
