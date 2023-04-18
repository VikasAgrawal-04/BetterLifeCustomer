import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_constants.dart';

class MyTheme {
  static const border = UnderlineInputBorder(
    borderSide: BorderSide(color: kPrimaryColor), //<-- SEE HERE
  );

  static ThemeData light(BuildContext context) {
    final fontFamily = GoogleFonts.dmSans().fontFamily;
    return ThemeData(
      // fontFamily: 'Gilroy',
      fontFamily: fontFamily,
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
      textTheme: Theme.of(context).textTheme.copyWith(
            titleMedium: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: fontFamily,
            ),
            titleLarge: TextStyle(
              // color: Colors.black,
              // fontSize: 16,
              // fontWeight: FontWeight.w600,
              fontFamily: fontFamily,
            ),
            bodyLarge: TextStyle(
              fontFamily: fontFamily,
            ),
            bodyMedium: TextStyle(
              fontFamily: fontFamily,
            ),
            bodySmall: TextStyle(
              fontFamily: fontFamily,
            ),
            displayLarge: TextStyle(
              fontFamily: fontFamily,
            ),
            displayMedium: TextStyle(
              fontFamily: fontFamily,
            ),
            displaySmall: TextStyle(
              fontFamily: fontFamily,
            ),
            labelLarge: TextStyle(
              fontFamily: fontFamily,
            ),
            labelMedium: TextStyle(
              fontFamily: fontFamily,
            ),
            labelSmall: TextStyle(
              fontFamily: fontFamily,
            ),
          ),
      // textTheme: TextTheme(

      //   titleMedium: TextStyle(
      //     color: Colors.black,
      //     fontSize: 16,
      //     fontWeight: FontWeight.w600,
      //     fontFamily: fontFamily,
      //   ),
      //   titleLarge: TextStyle(
      //     // color: Colors.black,
      //     // fontSize: 16,
      //     // fontWeight: FontWeight.w600,
      //     fontFamily: fontFamily,
      //   ),
      // ),
      colorScheme: ThemeData.light().colorScheme.copyWith(
            secondary: kSecondaryLightColor,
            background: kPrimaryColor,
          ),
    );
  }
}
