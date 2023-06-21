import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/font/app_font.dart';

class AdminDate extends StatelessWidget {
  final String eventDate;
  final String reminder;
  final String ringtone;

  const AdminDate({
    super.key,
    required this.eventDate,
    required this.reminder,
    required this.ringtone,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tanggal Acara : ' + eventDate,
            style: AppFont.textDescription,
          ),
          Text(
            'Reminder : ' + reminder,
            style: AppFont.textDescription,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(text: 'Ringtone : ', style: AppFont.textDescription),
                TextSpan(text: ringtone, style: AppFont.textDescription),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
