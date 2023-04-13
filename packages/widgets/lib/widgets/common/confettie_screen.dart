import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Confettie extends StatelessWidget {
  const Confettie({super.key});

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      'assets/animations/confetti.json',
      fit: BoxFit.cover,
    );
  }
}
