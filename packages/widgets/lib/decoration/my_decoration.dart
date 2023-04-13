import 'package:flutter/material.dart';
import 'package:my_theme/my_theme.dart';
import 'package:widgets/widgets.dart';

class MyDecoration {
  static BoxDecoration decoraion() {
    final boxShadow = [
      BoxShadow(
        color: kPrimaryColor.withOpacity(0.1),
        blurRadius: 20.0,
        spreadRadius: 0.0,
        offset: const Offset(10.0, -10.0), // shadow direction: bottom right
      ),
    ];
    return BoxDecoration(
      borderRadius: kBorderRadius,
      boxShadow: boxShadow,
      color: Colors.white,
    );
  }

  static const dialogShape = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(color: Colors.transparent),
  );
}
