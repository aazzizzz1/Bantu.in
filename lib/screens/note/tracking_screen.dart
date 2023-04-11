import 'package:bantuin/components/component_tracking.dart';
import 'package:bantuin/screens/note/notes_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../constants/color/app_color.dart';
import '../../constants/font/app_font.dart';

class TracingScreen extends StatelessWidget {
  final double progress;
  final bool? isFirst;
  final bool? iEnd;

  const TracingScreen({
    super.key,
    required this.progress,
    this.isFirst,
    this.iEnd,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 76,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Progress',
                  style: AppFont.medium14,
                ),
                SizedBox(width: 10.0),
                Container(
                  padding: EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: AppColor.completeColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text('${(progress * 100).toStringAsFixed(0)}%',
                      style: AppFont.regularprogres12),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Progress Catatan',
              style: AppFont.textTitleScreen,
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 218,
              margin: const EdgeInsets.only(left: 28),
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Expanded(
                    child: Column(
                      children: [
                        ComponentTracking(
                            index: index,
                            user: 'Admin',
                            massage: 'Membuat pesan',
                            date: '02/03/2023')
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardTracking(BuildContext context, int index, String date, String user,
      String massage) {
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
