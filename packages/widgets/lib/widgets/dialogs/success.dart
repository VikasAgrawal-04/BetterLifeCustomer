import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../constants/constants.dart';
import '../buttons/buttons.dart';
import 'dialog_layout.dart';

class SuccessDialog extends StatelessWidget {
  final VoidCallback onTap;
  final String? message, buttonText;

  const SuccessDialog(
      {Key? key, required this.onTap, this.message, this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      child: Padding(
        padding: kPadding,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            LottieBuilder.asset(
              'assets/animations/success.json',
            ),
            const Gap(20),
            Text(
              message ?? 'Success',
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(15),
            MyElevatedButton(
              text: buttonText ?? 'Close',
              onPressed: () async => onTap(),
            ),
          ],
        ),
      ),
    );
  }
}
