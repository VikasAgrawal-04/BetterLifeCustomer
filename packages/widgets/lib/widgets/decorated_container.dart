import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class DecoratedContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  final Color? color;
  final EdgeInsets? padding, margin;
  final Decoration? decoration;
  const DecoratedContainer({
    super.key,
    required this.child,
    this.color,
    this.decoration,
    this.height,
    this.width,
    this.padding,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: height,
      width: width,
      duration: kDuration,
      curve: kCurve,
      margin: margin,
      padding: padding ?? kPadding,
      decoration: decoration ?? MyDecoration.decoraion(),
      child: child,
    );
  }
}
