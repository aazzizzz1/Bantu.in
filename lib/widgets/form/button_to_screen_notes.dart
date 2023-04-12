import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/screens/note/notes_screen.dart';
import 'package:flutter/material.dart';

class ButtonScreenNotes extends StatelessWidget {
  const ButtonScreenNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoteScreen()),
        );
      },
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(EdgeInsets.all(16.0)),
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
