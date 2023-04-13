import 'package:api/api.dart';
import 'package:better_life_customer/reward/cubit/cubit.dart';
import 'package:flutter/material.dart';

class LiveCoinsCount extends StatelessWidget {
  const LiveCoinsCount({super.key, this.style});
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: context.read<ApiRepo>().userStream,
      builder: (context, snapshot) {
        return Text(
          snapshot.data?.balancePoints == null
              ? '0'
              : snapshot.data!.balancePoints.toString(),
          style: style,
        );
      },
    );
  }
}
