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
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: AppColorPrimary.primary3,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20)),
          child: Text('Kak Lea', style: AppFont.textNameTimActive),
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
          ],
        ),
      ],
    );
  }
}
