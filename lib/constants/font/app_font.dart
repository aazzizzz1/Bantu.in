import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../color/app_color.dart';

class AppFont {
  static TextStyle get regular28 => GoogleFonts.ibmPlexSans(
        fontSize: 28,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );
  static TextStyle get semiBold20 => GoogleFonts.ibmPlexSans(
        fontSize: 20,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );
  static TextStyle get regular20 => GoogleFonts.ibmPlexSans(
        fontSize: 20,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );
  static TextStyle get semiBold14 => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );
  static TextStyle get medium14 => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );
  static TextStyle get medium12 => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );
  static TextStyle get regular12 => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );
  static TextStyle get textDescription => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColorNeutral.neutral6,
      );
  static TextStyle get textSubjectOrTitle => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      );
  static TextStyle get textFillButton => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: AppColorNeutral.neutral1,
      );
  static TextStyle get textOutlineButton => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 212, 32, 41),
      );
  static TextStyle get labelForm => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        // fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 82, 82, 82),
      );
  static TextStyle get hintTextField => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 168, 168, 168),
      );
  static TextStyle get titlePoint => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: AppColorPrimary.primary6,
      );
  static TextStyle get quotaOfNote => GoogleFonts.ibmPlexSans(
        fontSize: 20,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColorPrimary.primary6,
      );
  static TextStyle get textInvitation => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        color: AppColorPrimary.primary6,
      );
}
