import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const MyTextButton({super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: Colors.grey.shade900,
        alignment: Alignment.centerRight,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Colors.grey.shade500,
        ),
      ),
    );
  }
}
