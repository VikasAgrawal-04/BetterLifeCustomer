import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../buttons/my_elevated_button.dart';
import 'dialog_layout.dart';

class ErrorDialog extends StatelessWidget {
  final String message;
  final String? buttonText;
  final VoidCallback onTap;

  const ErrorDialog({
    Key? key,
    required this.message,
    this.buttonText,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(20),
          Center(
            child: Lottie.asset(
              'packages/widgets/assets/animations/error.json',
              height: 100,
              // width: 50,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: context.textTheme.titleLarge,
            ),
          ),
          const Gap(20),
          MyElevatedButton(
            text: buttonText ?? ('Continue'),
            width: (MediaQuery.of(context).size).width * 0.30,
            color: const Color.fromARGB(255, 255, 17, 0),
            padding: const EdgeInsets.all(10),
            onPressed: () async {
              onTap();
              // Get.back();
            },
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
