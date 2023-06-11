import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../color/app_color.dart';

class AppFont {
  static TextStyle get semiBold16w500 => GoogleFonts.ibmPlexSans(
        fontSize: 16,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: Colors.black,
      );
  static TextStyle get regular28 => GoogleFonts.ibmPlexSans(
        fontSize: 28,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      );
  static TextStyle get regular16w500 => GoogleFonts.ibmPlexSans(
        fontSize: 16,
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
  static TextStyle get regularprogres12 => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColor.textprogresColor,
      );
  static TextStyle get textDescription => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColorNeutral.neutral6,
      );
  static TextStyle get textDescriptionRedeem => GoogleFonts.ibmPlexSans(
        fontSize: 14,
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
  static TextStyle get textFillButtonActive => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColorNeutral.neutral1,
      );
  static TextStyle get textErrorOutlineButton => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: Color.fromARGB(255, 212, 32, 41),
      );
  static TextStyle get labelTextForm => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 82, 82, 82),
      );
  static TextStyle get errorTextForm => GoogleFonts.ibmPlexSans(
      fontSize: 12,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w400,
      color: AppColorRed.red5);
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
  static TextStyle get textBottomSheet => GoogleFonts.ibmPlexSans(
        fontSize: 20,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColorNeutral.neutral7,
      );
  static TextStyle get textInvitation => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        color: AppColorPrimary.primary6,
      );
  static TextStyle get textPersonOrTeam => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: AppColorNeutral.neutral8,
      );
  static TextStyle get textStatusNote => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: AppColorPrimary.primary6,
      );
  static TextStyle get cancelText => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w500,
        color: AppColorNeutral.neutral8,
      );
  static TextStyle get disableText => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 141, 141, 141),
      );
  static TextStyle get inputAndNormalText => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 22, 22, 22),
      );
  // static TextStyle get textUploadDone => GoogleFonts.ibmPlexSans(
  //       fontSize: 12,
  //       fontStyle: FontStyle.normal,
  //       fontWeight: FontWeight.w400,
  //       color: Color.fromARGB(255, 162, 25, 32),
  //     );
  static TextStyle get textUploadDone => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 14, 96, 39),
      );
  static TextStyle get textUploadError => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColorRed.red5,
      );
  static TextStyle get textCompletedNote => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColorPrimary.primary9,
      );
  static TextStyle get textHalfStatusNote => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 197, 79, 0),
      );
  static TextStyle get textZeroProgress => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 162, 25, 32),
      );
  static TextStyle get textHalfProgress => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 197, 79, 0),
      );
  static TextStyle get textProgressComplete => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 14, 96, 39),
      );
  static TextStyle get textStatusError => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColorRed.red6,
      );
  static TextStyle get textStatusActive => GoogleFonts.ibmPlexSans(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColorPrimary.primary6,
      );
  static TextStyle get textTitleScreen => GoogleFonts.ibmPlexSans(
        fontSize: 20,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w600,
        color: Color.fromARGB(255, 22, 22, 22),
      );
  static TextStyle get textButtonActive => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 15, 99, 254),
      );
  static TextStyle get textButtonDisable => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColorNeutral.neutral6,
      );
  static TextStyle get textButtonError => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 206, 48, 56),
      );
  static TextStyle get textNameTimActive => GoogleFonts.ibmPlexSans(
      fontSize: 16,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w500,
      color: AppColorPrimary.primary7);
  static TextStyle get textButtonUnderline => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: Color.fromARGB(255, 15, 99, 254),
        decoration: TextDecoration.underline,
      );
  static TextStyle get clientTextDate => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColorNeutral.neutral6,
      );
  static TextStyle get textNotificationActive => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColorPrimary.primary6,
      );
  static TextStyle get textNotificationError => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColorRed.red6,
      );
  static TextStyle get textNotificationTime => GoogleFonts.ibmPlexSans(
        fontSize: 14,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColorNeutral.neutral5,
      );
  static TextStyle get textScreenEmpty => GoogleFonts.ibmPlexSans(
        fontSize: 20,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: AppColorNeutral.neutral4,
      );
}
