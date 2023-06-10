import 'package:bantuin/models/notification.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/color/app_color.dart';
import '../constants/font/app_font.dart';

class CardNotification extends StatelessWidget {
  final DetailNotificationModel notif;

  const CardNotification({
    super.key,
    required this.notif,
  });

  @override
  Widget build(BuildContext context) {
    if (notif.sender != null) {
      return Container(
        margin: const EdgeInsets.only(bottom: 8),
        height: MediaQuery.of(context).size.height * 0.15,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: const Border.fromBorderSide(
              BorderSide(color: AppColorNeutral.neutral2, width: 1)),
          borderRadius: BorderRadius.circular(4),
          color: AppColorNeutral.neutral1,
        ),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      '${notif.photo}', // Ubah menjadi notif.photo sebagai sumber gambar
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  imageBuilder: (context, imageProvider) => Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: imageProvider,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 12,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 55,
                  child: RichText(
                    overflow: TextOverflow.visible,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: notif.sender,
                          style: AppFont.semiBold14,
                        ),
                        TextSpan(
                          text: notif.title == "menerima"
                              ? " menerima "
                              : " menolak ", 
                          style: notif.title == "menerima"
                              ? AppFont.textNotificationActive
                              : AppFont.textNotificationError,
                        ),
                        TextSpan(
                          text: notif.notifType == "collab"
                              ? " catatan anda"
                              : " undangan tim anda",
                          style: AppFont.medium14,
                        ),
                        TextSpan(
                          text: "\n ${notif.send}",
                          style: AppFont.textNotificationTime,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      notif.notifType == "team"
                          ? SvgPicture.asset(
                              'lib/assets/icons/Team.svg',
                              color: AppColorPrimary.primary6,
                              height: 24,
                            )
                          : SvgPicture.asset(
                              'lib/assets/icons/Task 2.svg',
                              color: AppColorPrimary.primary6,
                              height: 24,
                            ),
                      SizedBox(
                        width: 8,
                      ),
                      Flexible(
                        child: Text(
                          notif.senderPlace == 0
                              ? "Tidak ada lokasi"
                              : notif.senderPlace.toString(),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppFont.textInvitation,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return SizedBox
          .shrink(); // Mengembalikan widget kosong jika notif.sender null
    }
  }
}
  // "title": "telah menerima catatan anda",
  // "body": "nil",
  // "recipient": "Abdul aziz",
  // "read": false,
  // "sender": "Dausmini",
  // "photo": "https://res-5.cloudinary.com/dis2k0keq/image/upload/v1685800569/public/profile_picture/f6ca2ac641.jpg",
  // "sender_place": 382,
  // "created": "2023-06-10T07:46:56.005+07:00",
  // "send": "2 menit yang lalu",
  // "notif_type": "invite"