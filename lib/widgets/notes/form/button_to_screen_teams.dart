import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/screens/tim/tim_screen.dart';
import 'package:flutter/material.dart';

class ButtonScreenTim extends StatelessWidget {
  const ButtonScreenTim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TimScreen()),
        );
      },
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 120, vertical: 15),
        ),
        elevation: MaterialStatePropertyAll(0),
        backgroundColor: MaterialStatePropertyAll(AppColor.activeColor),
      ),
      child: Center(
        child: Text(
          'Buat Catatan',
          style: AppFont.textFillButtonActive,
        ),
      ),
    );
  }
}
