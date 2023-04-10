import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../constants/color/app_color.dart';
import '../../../constants/font/app_font.dart';
import '../../../screens/note/tracking_screen.dart';

class AdminAppbar extends StatelessWidget {
  final double? progress;
  const AdminAppbar({super.key, this.progress});

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
                builder: (context) => TracingScreen(
                    progress: this.progress == null ? 0 : this.progress!),
              ));
            },
            child: Text(
              "Lihat",
              style: AppFont.textButtonActive,
            ),
          ),
          SizedBox(width: 10.0),
          Container(
            padding: EdgeInsets.all(4.0),
            decoration: BoxDecoration(
              color: AppColor.completeColor,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: progress == null
                ? Text('0%', style: AppFont.regularprogres12)
                : Text('${(progress! * 100).toStringAsFixed(0)}%',
                    style: AppFont.regularprogres12),
          ),
        ],
      ),
    );
  }
}
