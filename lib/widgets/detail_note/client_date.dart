import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

import '../../constants/color/app_color.dart';
import '../../constants/font/app_font.dart';

class ClientDate extends StatelessWidget {
  final DateTime eventDate;
  final DateTime reminder;
  const ClientDate({
    super.key,
    required this.eventDate,
    required this.reminder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(
          thickness: 1,
          color: AppColorNeutral.neutral2,
        ),
        SizedBox(
          height: 72,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tanggal Acara : ${DateFormat('EEEE dd MMMM yyyy hh:mm aa', 'id_ID').format(eventDate)}',
                style: AppFont.clientTextDate,
              ),
              Text(
                'Reminder : ${DateFormat('EEEE dd MMMM yyyy hh:mm aa', 'id_ID').format(reminder)}',
                style: AppFont.clientTextDate,
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 1,
          color: AppColorNeutral.neutral2,
        ),
      ],
    );
  }
}
