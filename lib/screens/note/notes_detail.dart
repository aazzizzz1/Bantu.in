import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:flutter/material.dart';

class NotesDetail extends StatelessWidget {
  final String title;
  final String description;
  final String avatarUrl;
  final String name;
  final String fileUrl;
  final String createdBy;
  final String eventDate;
  final String reminder;
  final String ringtone;

  NotesDetail({
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Note Detail',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppFont.semiBold14,
            ),
            SizedBox(height: 8.0),
            Row(
              children: [
                Icon(
                  Icons.person,
                  size: 20.0,
                  color: AppColorPrimary.primary6,
                ),
                SizedBox(width: 8.0),
                Text(
                  name,
                  style: AppFont.regular12,
                ),
                SizedBox(width: 8.0),
                CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl),
                  radius: 12.0,
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              description,
              style: AppFont.regular12,
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(
                  Icons.attach_file,
                  size: 20.0,
                  color: AppColorPrimary.primary6,
                ),
                SizedBox(width: 8.0),
                Text(
                  fileUrl,
                  style: AppFont.regular12,
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(
                  Icons.person_outline,
                  size: 20.0,
                  color: AppColorPrimary.primary6,
                ),
                SizedBox(width: 8.0),
                Text(
                  createdBy,
                  style: AppFont.regular12,
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(
                  Icons.event,
                  size: 20.0,
                  color: AppColorPrimary.primary6,
                ),
                SizedBox(width: 8.0),
                Text(
                  eventDate,
                  style: AppFont.regular12,
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(
                  Icons.notifications_none,
                  size: 20.0,
                  color: AppColorPrimary.primary6,
                ),
                SizedBox(width: 8.0),
                Text(
                  reminder,
                  style: AppFont.regular12,
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(
                  Icons.music_note,
                  size: 20.0,
                  color: AppColorPrimary.primary6,
                ),
                SizedBox(width: 8.0),
                Text(
                  ringtone,
                  style: AppFont.regular12,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
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
                    child: Text('Update'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Show confirmation dialog before deleting notes
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
                    child: Text('Delete'),
                    style: ElevatedButton.styleFrom(primary: Colors.red),
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