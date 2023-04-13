// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:widgets/widgets.dart';

class HistoryTile extends StatelessWidget {
  final Widget title;
  final Widget subtitle;
  final Widget? subSubtitle;
  final bool shadow;
  const HistoryTile({
    required this.title,
    required this.subtitle,
    super.key,
    this.subSubtitle,
    this.shadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: kBorderRadius,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 204, 204, 204),
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Lottie.asset(
            'assets/animations/gold-coin.json',
            animate: false,
            fit: BoxFit.cover,
          ),
          const Gap(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              title,
              subtitle,
              if (subSubtitle != null) subSubtitle!,
            ],
          ),
        ],
      ),
    );
  }
}
