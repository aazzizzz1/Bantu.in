import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/screens/note/notes_all_file.dart';
import 'package:bantuin/screens/note/notes_all_member.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/color/app_color.dart';
import '../../constants/font/app_font.dart';

class AdminMember extends StatelessWidget {
  final NoteDetailModel noteDetail;

  const AdminMember({super.key, required this.noteDetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Container(
            //   padding: EdgeInsets.all(8),
            //   decoration: BoxDecoration(
            //       color: AppColorPrimary.primary3,
            //       shape: BoxShape.rectangle,
            //       borderRadius: BorderRadius.circular(20)),
            //   child: ,
            //     // children: _emails.map((email) {
            //     //   return InputChip(
            //     //     label: Text(email),
            //     //     onDeleted: () => _removeEmail(_emails.indexOf(email)),
            //     //   );
            //     // }).toList(),
            //   ),
            //   // Text('Kak Lea', style: AppFont.textNameTimActive),
            // ),
            Wrap(
              spacing: 8.0,
              children: noteDetail.member.map((member) {
                return InputChip(
                  label: Text('${member.username}'),
                  labelStyle: AppFont.textNameTimActive,
                  disabledColor: AppColorPrimary.primary2,
                  padding: EdgeInsets.all(8),
                );
              }).toList(),
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Text(
                //   'dan 3 orang lagi.',
                //   style: AppFont.medium14,
                // ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NotesAllMember(
                                member: noteDetail.member,
                              )),
                    );
                  },
                  child: Text(
                    'Lihat semua.',
                    style: AppFont.textButtonActive,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 24.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'File Dokumen : ',
              style: AppFont.medium14,
            ),
            SizedBox(height: 7),
            // InkWell(
            //   onTap: () {},
            //   child: Text(
            //     fileUrl,
            //     style: AppFont.textButtonUnderline,
            //   ),
            // ),
            SizedBox(height: 11),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'dan 3 file lagi.',
                  style: AppFont.medium14,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotesAllFile()),
                    );
                  },
                  child: Text(
                    'Lihat semua.',
                    style: AppFont.textButtonActive,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
