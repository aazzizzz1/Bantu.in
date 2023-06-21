import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/models/post_note_model.dart';
import 'package:bantuin/screens/note/notes_screen.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class ButtonScreenNotes extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final PostNoteModel noteModel;
  const ButtonScreenNotes({
    Key? key,
    required this.formKey,
    required this.noteModel,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteViewModel>(
      builder: (context, note, _) => ElevatedButton(
        onPressed: () async {
          final isValidForm = formKey.currentState!.validate();
          if (isValidForm) {
            try {
              await note.postPersonalNote(noteModel).then(
                    (value) => Fluttertoast.showToast(
                            msg: 'Berhasil menambahkan catatan')
                        .then(
                      (value) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const NoteScreen()),
                      ),
                    ),
                  );
            } catch (e) {
              Fluttertoast.showToast(msg: e.toString());
              print(e);
            }

            // Navigator.pushReplacement(
            //   context,
            //   MaterialPageRoute(builder: (context) => const NoteScreen()),
            // );
          }
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
      ),
    );
  }
}
