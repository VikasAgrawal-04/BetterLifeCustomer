import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(horizontal: 25),
      color: Colors.grey.withOpacity(0.2),
      height: 1.0,
    );
  }
}
