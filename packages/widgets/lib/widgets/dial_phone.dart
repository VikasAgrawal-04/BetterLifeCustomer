import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class DialPhone extends StatelessWidget {
  final String phone;
  final VoidCallback? onTap;
  const DialPhone({super.key, required this.phone, this.onTap});

  @override
  Widget build(BuildContext context) {
    final recognizer = TapGestureRecognizer()..onTap = onTap;
    return RichText(
      text: TextSpan(
        style: _style(context),
        recognizer: recognizer,
        children: [
          TextSpan(
            text: phone,
            style: context.textTheme.titleSmall?.copyWith(
              color: context.theme.primaryColor,
              decoration: TextDecoration.underline,
            ),
          ),
        ],
      ),
    );
  }

  TextStyle? _style(BuildContext context) {
    return context.textTheme.titleSmall?.copyWith(
      color: context.theme.primaryColor,
    );
  }
}
