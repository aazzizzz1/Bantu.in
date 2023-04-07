import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/color/app_color.dart';
import '../../constants/font/app_font.dart';

class TracingScreen extends StatelessWidget {
  final double progress;
  const TracingScreen({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            margin: EdgeInsets.symmetric(horizontal: 16),
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
      body: Center(
        child: Text("Tracking On Progress"),
      ),
    );
  }
}
