// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:better_life_customer/widgets/appointment_card/time_button.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets/header_text.dart';

class CardHeader extends StatelessWidget {
  final String? date;
  final String? time;

  const CardHeader({
    required this.date,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeaderText(
          text: date ?? '',
          fontSize: 18,
        ),
        const Spacer(),
        TimeButton(
          time: time ?? '',
        ),
      ],
    );
  }
}
