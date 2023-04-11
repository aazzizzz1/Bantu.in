import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../constants/font/app_font.dart';

class ComponentTracking extends StatelessWidget {
  final int index;
  final String user;
  final String massage;
  final String date;
  const ComponentTracking({
    super.key,
    required this.index,
    required this.user,
    required this.massage,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      indicatorStyle: const IndicatorStyle(
        width: 12,
        height: 12,
      ),
      afterLineStyle: const LineStyle(
        color: Color.fromARGB(255, 193, 199, 205),
        thickness: 1,
      ),
      beforeLineStyle: const LineStyle(
        color: Color.fromARGB(255, 193, 199, 205),
        thickness: 1,
      ),
      isFirst: index == 0 ? true : false,
      // index == data.length
      isLast: index == 3 ? true : false,
      endChild: Container(
        margin: const EdgeInsets.symmetric(horizontal: 27, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: AppFont.textDescription,
            ),
            const SizedBox(
              height: 5,
            ),
            RichText(
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: user,
                    style: AppFont.semiBold14,
                  ),
                  TextSpan(
                    text: " $massage",
                    style: AppFont.medium14,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
