import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../constants/font/app_font.dart';

class EditDeleteNote extends StatelessWidget {
  final String title;
  final String description;
  final String avatarUrl;
  final String name;
  final String fileUrl;
  final String createdBy;
  final String eventDate;
  final String reminder;
  final String ringtone;

  const EditDeleteNote({
    super.key,
    required this.title,
    required this.description,
    required this.avatarUrl,
    required this.name,
    required this.fileUrl,
    required this.createdBy,
    required this.eventDate,
    required this.reminder,
    required this.ringtone,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            // Navigate to update notes page
            Navigator.pushNamed(
              context,
              '/update-notes',
              arguments: {
                'title': title,
                'description': description,
                'avatarUrl': avatarUrl,
                'name': name,
                'createdBy': createdBy,
                'fileUrl': fileUrl,
                'eventDate': eventDate,
                'reminder': reminder,
                'ringtone': ringtone,
              },
            );
          },
          child: Text(
            'Edit',
            style: AppFont.textButtonActive,
          ),
        ),
        SizedBox(width: 24),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Delete Notes?'),
                  content: Text('Are you sure you want to delete this notes?'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Perform delete operation and navigate back to previous screen
                        // ...
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: Text('Delete'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text(
            'Hapus',
            style: AppFont.textButtonError,
          ),
        ),
      ],
    );
  }
}
