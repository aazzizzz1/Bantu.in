import 'package:bantuin/components/popup_delete.dart';
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
  final String title;
  final String description;
  final String avatarUrl;
  final String name;
  final String fileUrl;
  final String createdBy;
  final String eventDate;
  final String reminder;
  final String ringtone;
  final bool? isAdmin;
  // final NoteModel note;

  const EditDeleteNote({
    super.key,
    required this.title,
    required this.description,
    required this.avatarUrl,
    required this.name,
    required this.fileUrl,
    required this.createdBy,
    required this.eventDate,
    required this.reminder,
    required this.ringtone,
    this.isAdmin,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController messageDeleteController = TextEditingController();
    return Row(
      children: [
        InkWell(
          onTap: () {
            // Navigate to update notes page
            // Navigate to update notes page
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) {
            //     return NotesDetail(
            //         notes: note);
            //   },
            // ));
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotesUpdate(
                      title: title,
                      description: description,
                      avatarUrl: avatarUrl,
                      name: name,
                      fileUrl: fileUrl,
                      createdBy: createdBy,
                      eventDate: eventDate,
                      reminder: reminder,
                      ringtone: ringtone),
                ));
            // Navigate to update notes page======
            // Navigator.pushNamed(
            //   context,
            //   '/update-notes',
            //   arguments: {
            //     'title': title,
            //     'description': description,
            //     'avatarUrl': avatarUrl,
            //     'name': name,
            //     'createdBy': createdBy,
            //     'fileUrl': fileUrl,
            //     'eventDate': eventDate,
            //     'reminder': reminder,
            //     'ringtone': ringtone,
            //   },
            // );
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
