import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final int? maxlines;
  final TextStyle? style;
  const HeaderText({
    super.key,
    required this.text,
    this.fontSize,
    this.maxlines,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: const Color(0xff0B2451),
          fontSize: fontSize ?? 20,
        );
    return AutoSizeText(
      text,
      style: style?.merge(this.style),
      maxLines: maxlines,
    );
  }
}
