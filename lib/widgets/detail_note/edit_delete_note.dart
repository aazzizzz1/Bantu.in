import 'package:bantuin/screens/note/notes_detail.dart';
import 'package:bantuin/screens/note/notes_update.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/color/app_color.dart';
import '../../constants/font/app_font.dart';
import '../../models/note_model.dart';

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
  });

  @override
  Widget build(BuildContext context) {
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
              barrierDismissible: false,
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Delete Notes?'),
                  content: Text('Are you sure you want to delete this notes?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Perform delete operation and navigate back to previous screen
                        // ...
                        Navigator.pop(context);
                        showDialog(
                          // barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                            alignment: Alignment.center,
                            title: Text(
                              'Silahkan tulis pesan kepada orang \n yang anda libatkan',
                              style: AppFont.semiBold14,
                              textAlign: TextAlign.center,
                            ),
                            content: Container(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pesan",
                                    style: AppFont.labelTextForm,
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      filled: true,
                                      hintText: 'Tulis Pesan',
                                      hintStyle: AppFont.hintTextField,
                                      fillColor: AppColorNeutral.neutral1,
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColorPrimary.primary6)),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColorNeutral.neutral2),
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: AppColorNeutral.neutral2),
                                        borderRadius: BorderRadius.circular(3),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              SizedBox(
                                width: 140,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  style: const ButtonStyle(
                                    overlayColor: MaterialStatePropertyAll(
                                        AppColorPrimary.primary4),
                                    padding: MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(
                                          horizontal: 24, vertical: 10),
                                    ),
                                    elevation: MaterialStatePropertyAll(0),
                                    backgroundColor: MaterialStatePropertyAll(
                                        AppColor.activeColor),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Kirim',
                                      style: AppFont.textFillButtonActive,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );

                        // Navigator.pop(context);
                      },
                      child: Text('Hapus'),
                    ),
                  ],
                );
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
