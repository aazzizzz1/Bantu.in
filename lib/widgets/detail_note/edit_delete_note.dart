import 'package:bantuin/components/popup_delete.dart';
import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/screens/note/notes_detail.dart';
import 'package:bantuin/screens/note/notes_update.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../constants/color/app_color.dart';
import '../../constants/font/app_font.dart';
import '../../models/user_note_model.dart';

class EditDeleteNote extends StatelessWidget {
  final NoteDetailModel note;

  const EditDeleteNote({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: note.status == 'completed'
              ? null
              : () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NoteUpdate(noteDetail: note)));
                },
          child: Text(
            'Edit',
            style: note.status == 'completed'
                ? AppFont.editDisable
                : AppFont.textButtonActive,
          ),
        ),
        SizedBox(width: 24),
        Consumer<NoteViewModel>(
          builder: (context, value, child) => InkWell(
            onTap: () {
              // PopupDelete(noteDetail: note);
              // note.notesType != 'personal'
              showDialog(
                barrierDismissible: false,
                context: context,
                builder: (BuildContext context) {
                  return PopupDelete(
                    noteDetail: note,
                  );
                },
              );
              // : value
              //     .deletePersonalNote(note)
              //     .then((value) =>
              //         Fluttertoast.showToast(msg: 'Note berhasil dihapus'))
              //     .then((value) => Navigator.pop(context));
            },
            child: Text(
              'Hapus',
              style: AppFont.textButtonError,
            ),
          ),
        ),
      ],
    );
  }
}
