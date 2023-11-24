import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';

import '../buttons/buttons.dart';
import 'dialog_layout.dart';

class NetworkErrorDialog extends StatelessWidget {
  final String message;
  final Widget? subtitle;
  final String buttonText;
  final VoidCallback onCancel;

  const NetworkErrorDialog({
    Key? key,
    required this.message,
    required this.onCancel,
    this.subtitle,
    this.buttonText = 'Ok',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DialogLayout(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 4 / 2,
            child: Lottie.asset(
              'assets/animations/error.json',
              frameRate: FrameRate.max,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[900],
                fontSize: 16,
              ),
            ),
          ),
          if (subtitle != null) const Gap(10),
          if (subtitle != null) subtitle!,
          const Gap(20),
          MyElevatedButton(
            text: buttonText,
            padding: const EdgeInsets.all(5),
            width: width * 0.35,
            onPressed: () async => onCancel(),
          ),
          const Gap(30),
        ],
      ),
    );
  }
}
