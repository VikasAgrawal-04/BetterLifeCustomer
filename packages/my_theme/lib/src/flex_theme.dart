import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constants.dart';

class MyTheme {
  static const border = UnderlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor), //<-- SEE HERE
  );

  static ThemeData get light => ThemeData(
        // fontFamily: 'Gilroy',
        fontFamily: GoogleFonts.dmSans().fontFamily,
        // fontFamily: GoogleFonts.dmSans().fontFamily,
        primaryColor: kPrimaryColor,
        canvasColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: border,
          focusedBorder: border,
          border: border,
          disabledBorder: border.copyWith(
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: kPrimaryColor,
          selectionColor: kPrimaryColor.withOpacity(0.1),
          selectionHandleColor: Colors.black,
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            shape: const StadiumBorder(),
            disabledForegroundColor: Colors.black.withOpacity(0.38),
            surfaceTintColor: Colors.black,
            padding: const EdgeInsets.all(15),
            side: BorderSide(
              color: Colors.grey.shade100,
              width: 1.5,
            ),
          ),
        ),
        colorScheme: ThemeData.light().colorScheme.copyWith(
              secondary: kSecondaryLightColor,
              background: kPrimaryColor,
            ),
      );
}
