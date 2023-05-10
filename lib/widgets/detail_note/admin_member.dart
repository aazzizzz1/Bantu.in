import 'package:bantuin/screens/note/notes_all_file.dart';
import 'package:bantuin/screens/note/notes_all_member.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/color/app_color.dart';
import '../../constants/font/app_font.dart';

class AdminMember extends StatelessWidget {
  final String fileUrl;
  const AdminMember({
    super.key,
    required this.fileUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: AppColorPrimary.primary3,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(20)),
              child: Text('Kak Lea', style: AppFont.textNameTimActive),
            ),
            const SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'dan 3 orang lagi.',
                  style: AppFont.medium14,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotesAllMember()),
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
            InkWell(
              onTap: () {},
              child: Text(
                fileUrl,
                style: AppFont.textButtonUnderline,
              ),
            ),
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
