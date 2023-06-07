import 'package:bantuin/components/component_tracking.dart';
import 'package:bantuin/screens/note/notes_detail.dart';
import 'package:bantuin/utils/app_state.dart';
import 'package:bantuin/view_models/history_viewmodel.dart';
import 'package:bantuin/widgets/shimmer_loading/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../constants/color/app_color.dart';
import '../../constants/font/app_font.dart';

class TracingScreen extends StatelessWidget {
  final String progress;

  const TracingScreen({
    super.key,
    required this.progress,
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
                  child: Text(progress, style: AppFont.regularprogres12),
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
            Consumer<HistoryViewModel>(
              builder: (context, history, child) {
                if (history.appState == AppState.loading) {
                  return Column(
                    children: const [
                      ShimmerContainer.rectangle(height: 25, width: 150),
                      SizedBox(height: 10),
                      ShimmerContainer.rectangle(height: 25, width: 150),
                      SizedBox(height: 10),
                      ShimmerContainer.rectangle(height: 25, width: 150),
                      SizedBox(height: 10),
                    ],
                  );
                }
                if (history.appState == AppState.loaded) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 218,
                    margin: const EdgeInsets.only(left: 28),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        ComponentTracking(
                          index: 0,
                          user: 'Anda',
                          massage: 'telah membuat catatan',
                          date: DateFormat('dd/MM/yyyy')
                              .format(history.noteHistory.noteCreated)
                              .toString(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.6,
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: history.listOfHistory.length,
                            itemBuilder: (context, index) {
                              final data = history.listOfHistory[index];
                              String dateUpload =
                                  DateFormat('dd/MM/yyyy').format(data.date);
                              return ComponentTracking(
                                index: index + 1,
                                user: data.user,
                                massage: data.status,
                                date: dateUpload.toString(),
                                // date:
                                //     DateFormat('dd/MM/yyyy').format(data.date),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (history.appState == AppState.noData) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 218,
                    margin: const EdgeInsets.only(left: 28),
                    alignment: Alignment.center,
                    child: Column(
                      children: [
                        ComponentTracking(
                          index: 0,
                          user: 'Anda',
                          massage: 'telah membuat catatan',
                          date: DateFormat('dd/MM/yyyy')
                              .format(history.noteHistory.noteCreated)
                              .toString(),
                        ),
                      ],
                    ),
                  );
                }
                if (history.appState == AppState.failure) {
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      'Gagal mengambil progress',
                      style: AppFont.textScreenEmpty,
                    ),
                  );
                }
                return const SizedBox();
              },
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
