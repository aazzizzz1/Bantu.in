import 'package:bantuin/components/popup_delete.dart';
import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/screens/note/notes_detail.dart';
import 'package:bantuin/screens/note/notes_update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/color/app_color.dart';
import '../../constants/font/app_font.dart';
import '../../models/user_note_model.dart';

class EditDeleteNote extends StatelessWidget {
  final NoteDetailModel note;

  const EditDeleteNote({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    TextEditingController messageDeleteController = TextEditingController();
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NoteUpdate(noteDetail: note)));
          },
          child: Text(
            'Edit',
            style: AppFont.textButtonActive,
          ),
        ),
        SizedBox(width: 24),
        InkWell(
          onTap: () {
            showDialog(
              // barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return PopupDelete();
              },
            );
          },
          child: Text(
            'Hapus',
            style: AppFont.textButtonError,
          ),
        ),
      ],
    );
  }
}
