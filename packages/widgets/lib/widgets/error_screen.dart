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
          // const Spacer(),
          Image.asset(
            'assets/3_Something Went Wrong.png',
          ),
          // const SizedBox(height: 20),
          // Text(
          //   message ?? 'Something went wrong',
          //   style: Theme.of(context).textTheme.titleLarge,
          // ),
          // const Spacer(),
        ],
      ),
    );
  }
}
