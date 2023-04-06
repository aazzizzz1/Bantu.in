import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/screens/note/notes_detail.dart';
import 'package:flutter/material.dart';

class CardIncomingNotes extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String month;
  final String avatarUrl;
  final String name;
  final double progress;

  CardIncomingNotes({
    required this.title,
    required this.description,
    required this.date,
    required this.month,
    required this.avatarUrl,
    required this.name,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NotesDetail(),
          ),
        );
      },
      child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16.0),
      ),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  date,
                  style: AppFont.semiBold20
                ),
                Text(month,
                    style: AppFont.semiBold20
                ),
              ],
            ),
          ),
          Container(
              width: 0.5,
              height: 120.0,
              color: Colors.grey,
            ),
          SizedBox(width: 16.0),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: AppFont.semiBold14
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: AppColor.completeColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        '${(progress * 100).toStringAsFixed(0)}%',
                        style: AppFont.regularprogres12
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey[300],
                  valueColor: AlwaysStoppedAnimation<Color>(AppColor.textprogresColor),
                ),
                SizedBox(height: 8.0),
                Text(
                  description,
                  style: AppFont.regular12
                ),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    //add icon
                    Icon(
                      Icons.person,
                      size: 20.0,
                      color: AppColorPrimary.primary6,
                      ),
                    SizedBox(width: 8.0),
                    Text(
                      'Personal',
                      style: AppFont.regular12
                    ),
                    SizedBox(width: 8.0),
                    CircleAvatar(
                      backgroundImage: NetworkImage(avatarUrl),
                      radius: 12.0,
                    ),
                    SizedBox(width: 8.0),
                    Text(
                      name,
                      style: AppFont.regular12,
                    ),
                  ],
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