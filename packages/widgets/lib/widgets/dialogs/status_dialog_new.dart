import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:widgets/widgets.dart';

class StatusDialog extends StatelessWidget {
  final String lottieAsset;
  final String message;
  final VoidCallback onContinue;
  const StatusDialog({
    Key? key,
    required this.lottieAsset,
    required this.message,
    required this.onContinue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DialogLayout(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AspectRatio(
            aspectRatio: 4 / 3,
            child: Lottie.asset(lottieAsset),
          ),
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
            text: ('Continue'),
            width: MediaQuery.of(context).size.width * 0.3,
            // height: 40.h,

            padding: const EdgeInsets.all(10),
            onPressed: () async {
              onContinue();
              // Get.back();
            },
          ),
          const Gap(20),
        ],
      ),
    );
  }
}
