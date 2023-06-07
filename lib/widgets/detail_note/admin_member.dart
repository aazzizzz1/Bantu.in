import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/screens/note/file_preview_screen.dart';
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
            SizedBox(
              height: noteDetail.member.length * 35,
              width: MediaQuery.of(context).size.width,
              child: noteDetail.member.length > 3
                  // If member more than 3
                  ? Column(
                      children: [
                        SizedBox(
                          height: noteDetail.member.length * 30,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 3,
                            itemBuilder: (context, index) {
                              final data = noteDetail.member[index];
                              return Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  height: 40,
                                  width: data.username.characters.length * 11,
                                  margin: const EdgeInsets.only(bottom: 6),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: AppColorPrimary.primary3,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Text(data.username,
                                      style: AppFont.textNameTimActive),
                                ),
                              );
                            },
                          ),
                        ),
                        // Text when member more than 3
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'dan ${noteDetail.member.length - 3} orang lagi.',
                              style: AppFont.medium14,
                            ),
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
                    )
                  // If member less than 3
                  : ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: noteDetail.member.length,
                      itemBuilder: (context, index) {
                        final data = noteDetail.member[index];
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: data.username.characters.length * 11,
                            // margin: EdgeInsets.only(
                            //     right: data.username.characters.length * 10),
                            decoration: BoxDecoration(
                                color: AppColorPrimary.primary3,
                                borderRadius: BorderRadius.circular(20)),
                            child: Text(data.username,
                                style: AppFont.textNameTimActive),
                          ),
                        );
                      },
                    ),
            ),
            const SizedBox(height: 12.0),
          ],
        ),
        const SizedBox(height: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'File Dokumen : ',
              style: AppFont.medium14,
            ),
            const SizedBox(height: 8),
            SizedBox(
              height:
                  noteDetail.file.isEmpty ? 20 : noteDetail.file.length * 10,
              child: noteDetail.file.isEmpty
                  ? SizedBox(
                      child: Text(
                        'Belum ada file yang di upload',
                        style: AppFont.regular12,
                      ),
                    )
                  : noteDetail.file.length > 3
                      ? Column(
                          children: [
                            SizedBox(
                              height: 80,
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (context, index) {
                                  final data = noteDetail.file[index];
                                  return InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                FilePreviewScreen(
                                              url: data,
                                              isAdmin: true,
                                            ),
                                          ));
                                    },
                                    child: Text(
                                      data.substring(data.lastIndexOf("/") + 1),
                                      style: AppFont.textButtonUnderline,
                                    ),
                                  );
                                },
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'dan ${noteDetail.file.length - 3} file lagi.',
                                  style: AppFont.medium14,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => NotesAllFile(
                                                file: noteDetail.file,
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
                        )
                      : SizedBox(
                          height: 100,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: noteDetail.file.length,
                            itemBuilder: (context, index) {
                              final data = noteDetail.file[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => FilePreviewScreen(
                                          url: data,
                                          isAdmin: true,
                                        ),
                                      ));
                                },
                                child: Text(
                                  data.substring(data.lastIndexOf("/") + 1),
                                  style: AppFont.textButtonUnderline,
                                ),
                              );
                            },
                          ),
                        ),
            ),
            const SizedBox(height: 11),
          ],
        ),
      ],
    );
  }
}
