import 'package:flutter/material.dart';

import 'status_dialog_new.dart';

class MailSentDialog extends StatelessWidget {
  final String message;
  final VoidCallback onContinue;

  const MailSentDialog(
      {Key? key, required this.message, required this.onContinue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatusDialog(
      lottieAsset: 'assets/animations/mail_sent.json',
      message: message,
      onContinue: onContinue,
    );
  }
}
