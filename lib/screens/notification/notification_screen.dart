import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../constants/color/app_color.dart';
import '../../constants/font/app_font.dart';
import '../../utils/app_state.dart';
import '../../view_models/notification_viewmodel.dart';
import '../../widgets/shimmer_loading/shimmer_card_widget.dart';
import '../../components/card_notification.dart';
import '../../components/card_notification_update.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<NotificationViewModel>(context, listen: false)
            .fetchNotif());
  }

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
      body: Consumer<NotificationViewModel>(
        builder: (context, notif, child) {
          if (notif.appState == AppState.loading) {
            return _loadingContainer();
          } else if (notif.appState == AppState.loaded) {
            return Column(
              children: [
                notif.listOfNotif.isEmpty
                    ? Center(
                        child: Text(
                          'Tidak ada notifikasi',
                        ),
                      )
                    : SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.885,
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemCount: notif.listOfNotif.length,
                          itemBuilder: (context, index) {
                            var data = notif.listOfNotif[index];
                            return Column(
                              children: [
                                if (data.notifType == 'client')
                                  CardNotificationUpdate(notif: data),
                                if (data.notifType == 'team' || data.notifType == 'collab' )
                                  CardNotification(notif: data),
                              ],
                            );
                          },
                        ),
                      ),
              ],
            );
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }

  Widget _loadingContainer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return ShimmerCardWidget();
        },
      ),
    );
  }
}

// "title": "Abdul aziz Telah Mengubah Deskripsi Catatan coba notif colab",
// "body": "Cobain si",
// "recipient": "Abdul aziz",
// "read": false,
// "sender": "Abdul aziz",
// "photo": "https://res-4.cloudinary.com/dis2k0keq/image/upload/v1685772003/public/profile_picture/5bb8c28d57.jpg",
// "sender_place": 377,
// "created": "2023-06-09T23:27:54.096+07:00",
// "send": "1 menit yang lalu"

// CardNotificationUpdate(
//   user: 'Masbro',
//   status: 'mengedit',
//   time: 6,
//   subject: 'Ulang Tahun Adik',
//   massage: 'Halo, aku mau mengedit acara ',
//   accepted: true,
// ),
// CardNotificationUpdate(
//   user: 'Masbro',
//   status: 'menghapus',
//   time: 6,
//   subject: 'Ulang Tahun Adik',
//   massage: 'Halo, aku mau menghapus acara ',
//   accepted: false,
// ),
// CardNotification(
//   user: 'Nadim Makrim',
//   status: 'menolak',
//   time: 10,
//   subject: 'Membeli tiket pesawat',
//   accepted: false,
// ),
// CardNotification(
//   user: 'Asep',
//   status: 'menerima',
//   time: 10,
//   subject: 'Membeli tiket pesawat',
//   accepted: true,
// ),
// CardNotification(
//   user: 'Asep',
//   status: 'menerima',
//   time: 1,
//   tim: true,
//   subject: 'Tim 4 - Qatros',
//   accepted: true,
// ),
// CardNotification(
//   user: 'John',
//   status: 'menolak',
//   time: 10,
//   tim: true,
//   subject: 'Tim 4 - Qatros',
//   accepted: false,
// ),