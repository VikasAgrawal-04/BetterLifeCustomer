import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String? message;
  const ErrorScreen({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/3_Something Went Wrong.png',
          ),
        ],
      ),
    );
  }
}
