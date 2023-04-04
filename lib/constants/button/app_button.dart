import 'dart:ui';
export '../color/app_color.dart';
export '../font/app_font.dart';

import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:flutter/material.dart';

class AppButton {
  static ButtonStyle get activeButton => ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(AppColor.activeColor),
        textStyle: MaterialStatePropertyAll(AppFont.textFillButton),
      );
  static ButtonStyle get errorButtonFill => ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(AppColor.errorColor),
        textStyle: MaterialStatePropertyAll(AppFont.textFillButton),
      );
}
