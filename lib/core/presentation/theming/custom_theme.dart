import 'package:friends_khata/core/presentation/theming/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData get appTheme {
    return ThemeData(
      primaryColor: Colors.black,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          color: Colors.black,
        ),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: Colors.black,
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.black,
        ),
      ),

      // scaffoldBackgroundColor: Colors.grey,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(),
      ),
      textTheme: const TextTheme(
        headline5: TextStyle(
          fontSize: 14,
          color: Colors.black,
          fontWeight: FontWeight.w600,
        ),
        // bodyText2: GoogleFonts.poppins(
        //   textStyle: const TextStyle(
        //     color: Colors.white,
        //   ),
        // ),
        // button: GoogleFonts.poppins(
        //   textStyle: const TextStyle(
        //     color: Colors.white,
        //     fontSize: 14,
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
        ),
      ),
      // textButtonTheme: TextButtonThemeData(
      //   style: TextButton.styleFrom(
      //     primary: CustomColors.mediumYellow,
      //   ),
      // ),
    );
  }
}
