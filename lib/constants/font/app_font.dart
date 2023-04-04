import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFont {
  static TextStyle get regular28 => GoogleFonts.ibmPlexSans(
        fontSize: 28,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        height: 36,
      );
  static TextStyle get semiBold20 => GoogleFonts.ibmPlexSans(
        fontSize: 20,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        height: 18,
      );
  static TextStyle get regular20 => GoogleFonts.ibmPlexSans(
        fontSize: 20,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        height: 28,
      );
  static TextStyle get semiBold14 => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        height: 18,
      );
  static TextStyle get medium14 => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        height: 18,
      );
  static TextStyle get medium12 => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        height: 16,
      );
  static TextStyle get regular12 => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        height: 16,
      );
  static TextStyle get textDescription => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 105, 112, 119),
        height: 16,
      );
  static TextStyle get textSubjectOrTitle => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        height: 18,
      );
  static TextStyle get textFillButton => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 242, 244, 248),
        height: 16,
      );
  static TextStyle get textOutlineButton => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 212, 32, 41),
        height: 16,
      );
}
