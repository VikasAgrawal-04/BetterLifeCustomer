import 'package:flutter/material.dart';

class MyLoadingIndicator extends StatelessWidget {
  final double? size;
  const MyLoadingIndicator({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.square(
        dimension: size ?? 20,
        child: const CircularProgressIndicator.adaptive(
          strokeWidth: 2,
          valueColor: AlwaysStoppedAnimation(Colors.black),
        ),
      ),
    );
  }
}
