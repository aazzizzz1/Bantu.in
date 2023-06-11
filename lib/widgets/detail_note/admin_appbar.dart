import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/color/app_color.dart';
import '../../constants/font/app_font.dart';
import '../../screens/note/tracking_screen.dart';

class AdminAppbar extends StatelessWidget {
  final String progress;
  final bool isHalf;
  final bool isFull;
  final bool isCompleted;
  const AdminAppbar({
    super.key,
    required this.progress,
    required this.isHalf,
    required this.isFull,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TracingScreen(progress: progress),
              ));
            },
            child: Text(
              "Lihat",
              style: AppFont.textButtonActive,
            ),
          ),
          SizedBox(width: 10.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: isHalf
                  ? AppColor.halfToFull
                  : isFull
                      ? AppColor.completeColor
                      : isCompleted
                          ? AppColorPrimary.primary2
                          : AppColor.zeroToHalf,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Text(
              progress != 'completed' ? progress : 'Catatan selesai',
              style: isHalf
                  ? AppFont.textHalfStatusNote
                  : isFull
                      ? AppFont.textUploadDone
                      : isCompleted
                          ? AppFont.textCompletedNote
                          : AppFont.textUploadError,
            ),
          ),
        ],
      ),
    );
  }
}
