import 'package:bantuin/components/card_notification.dart';
import 'package:bantuin/components/card_notification_update.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/color/app_color.dart';
import '../../constants/font/app_font.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back),
            color: Colors.black,
          ),
          title: Text(
            'Notifikasi',
            style: AppFont.regular20,
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: const [
                CardNotificationUpdate(
                  user: 'Masbro',
                  status: 'mengedit',
                  time: 6,
                  subject: 'Ulang Tahun Adik',
                  massage: 'Halo, aku mau mengedit acara ',
                  accepted: true,
                ),
                CardNotificationUpdate(
                  user: 'Masbro',
                  status: 'menghapus',
                  time: 6,
                  subject: 'Ulang Tahun Adik',
                  massage: 'Halo, aku mau menghapus acara ',
                  accepted: false,
                ),
                CardNotification(
                  user: 'Nadim Makrim',
                  status: 'menolak',
                  time: 10,
                  subject: 'Membeli tiket pesawat',
                  accepted: false,
                ),
                CardNotification(
                  user: 'Asep',
                  status: 'menerima',
                  time: 10,
                  subject: 'Membeli tiket pesawat',
                  accepted: true,
                ),
                CardNotification(
                  user: 'Asep',
                  status: 'menerima',
                  time: 1,
                  tim: true,
                  subject: 'Tim 4 - Qatros',
                  accepted: true,
                ),
                CardNotification(
                  user: 'John',
                  status: 'menolak',
                  time: 10,
                  tim: true,
                  subject: 'Tim 4 - Qatros',
                  accepted: false,
                ),
              ],
            );
          },
        ));
  }
}
