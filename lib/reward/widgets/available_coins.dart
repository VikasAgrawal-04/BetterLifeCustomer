import 'package:better_life_customer/widgets/coins_stream.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:widgets/widgets.dart';

class AvailableCoins extends StatelessWidget {
  const AvailableCoins({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(right: 10),
      margin: const EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      // width: 10,
      // height: 1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          LottieBuilder.asset(
            'assets/animations/coin.json',
            width: 40,
            height: 50,
          ),
          const SizedBox(width: 5),
          LiveCoinsCount(
            // '800',
            style: context.theme.textTheme.titleLarge,
          ),
        ],
      ),
    );
  }
}
