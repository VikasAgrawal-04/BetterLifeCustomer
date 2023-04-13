import 'package:flutter/material.dart';

class TextInputDecoration {
  static const contentPadding = EdgeInsets.symmetric(
    horizontal: 10,
    vertical: 12,
  );

  static const labelTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w600,
    fontSize: 16,
  );

  static const inputRadius = 4.0;
  static const inputFillColor = Color.fromARGB(255, 255, 255, 255);
  static const inputBorderColor = Color(0xffA2A2A6);
  static final inputBorderRadius = BorderRadius.circular(inputRadius);
  static const inputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(inputRadius)),
    borderSide: BorderSide(color: inputBorderColor),
    // borderSide: BorderSide(color: Color(0xfff3f5fc)),
  );

  // static var inputFillColor;
  static InputDecoration recangularInputDecoration(BuildContext context) {
    return InputDecoration(
      filled: true,
      isDense: true,
      // fillColor: const Color(0xffA2A2A6),
      // fillColor: Theme.of(context).primaryColor,
      fillColor: Colors.white,
      enabledBorder: inputBorder.copyWith(
        borderRadius: BorderRadius.circular(12),
      ),
      hintStyle: TextStyle(color: Theme.of(context).primaryColor),
      labelStyle: TextStyle(color: Theme.of(context).primaryColor),
      floatingLabelStyle: TextStyle(color: Theme.of(context).primaryColor),
      focusedBorder: inputBorder.copyWith(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Theme.of(context).primaryColor,
          width: 2,
        ),
      ),
      disabledBorder: inputBorder,
      border: inputBorder.copyWith(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  static InputDecoration stadiumInputDecoration(BuildContext context) {
    final theme = Theme.of(context);
    return InputDecoration(
      enabledBorder: inputBorder,
      focusedBorder: inputBorder.copyWith(
        borderSide: BorderSide(
          width: 2,
          color: theme.primaryColor,
        ),
      ),
      disabledBorder: inputBorder.copyWith(
        borderSide: BorderSide(
          width: 2,
          color: Colors.grey.shade200,
        ),
      ),
      border: inputBorder,
    );
  }
}
