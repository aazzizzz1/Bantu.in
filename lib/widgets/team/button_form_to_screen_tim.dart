import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/screens/tim/tim_screen.dart';
import 'package:bantuin/widgets/bottom_navigation/bottom_menu.dart';
import 'package:flutter/material.dart';

class ButtonFormToScreenTim extends StatelessWidget {
  const ButtonFormToScreenTim({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SizedBox(
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return BottomMenu(
                        currentTab: 1,
                        currentScreen: const TimScreen(),
                      );
                    }));
                  },
                  style: const ButtonStyle(
                    padding: MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 120, vertical: 15),
                    ),
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor:
                        MaterialStatePropertyAll(AppColor.activeColor),
                  ),
                  child: Center(
                    child: Text(
                      'Buat Tim',
                      style: AppFont.textFillButtonActive,
                    ),
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
