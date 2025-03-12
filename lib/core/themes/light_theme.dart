import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LightTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    fontFamily: GoogleFonts.cairo().fontFamily,
    primaryColor: kPrimaryColor,
  );
  static const kH1TextStyle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const kH2TextStyle = TextStyle(
    fontSize: 24.0, // equivalent to 1.5em
    fontWeight: FontWeight.bold,
  );

  static const kH3TextStyle = TextStyle(
    fontSize: 18, // 1.17em is approximately 18px
    fontWeight: FontWeight.bold,
    height: 1.5, // to match the margin-block-start and margin-block-end
  );

  static const kHeaderTextStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const kNormalTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
    color: kSecondaryColor,
  );

  static const kPrimaryColor = Color(0xff27ae60);

  static const kSecondaryColor = Color(0xff2c3e50);

  static const kInfoTextStyle = TextStyle(
    color: Color(0xff7f8c8d),
    fontSize: 12,
  );
}
