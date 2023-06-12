import 'package:bantuin/models/notification.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../constants/color/app_color.dart';
import '../constants/font/app_font.dart';
import '../view_models/notification_viewmodel.dart';

class CardNotificationCollab extends StatefulWidget {
  final DetailNotificationModel notif;

  const CardNotificationCollab({
    super.key,
    required this.notif,
  });

  @override
  State<CardNotificationCollab> createState() => _CardNotificationCollabState();
}

class _CardNotificationCollabState extends State<CardNotificationCollab> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   // Future.microtask(() =>
  //   //     Provider.of<NotificationViewModel>(context, listen: false)
  //   //         .getDetailNoteNotif(widget.notif.senderPlace));
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    if (widget.notif.sender != null) {
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
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    "${widget.notif.sender[0].toUpperCase()}",
                    style: GoogleFonts.ibmPlexSans(
                      fontSize: 24,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                // CachedNetworkImage(
                //   imageUrl: widget.notif.photo,
                //   // '${notif.photo}', // Ubah menjadi notif.photo sebagai sumber gambar
                //   // placeholder: (context, url) => CircularProgressIndicator(),
                //   // errorWidget: (context, url, error) => Icon(Icons.error),
                //   imageBuilder: (context, imageProvider) => Container(
                //     width: 50,
                //     height: 50,
                //     decoration: BoxDecoration(
                //       shape: BoxShape.circle,
                //       image: DecorationImage(
                //         fit: BoxFit.cover,
                //         image: imageProvider,
                //       ),
                //     ),
                //   ),
                // ),
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
                          text: widget.notif.sender,
                          style: AppFont.semiBold14,
                        ),
                        TextSpan(
                          text: widget.notif.title == "menerima"
                              ? " menerima "
                              : " menolak ",
                          style: widget.notif.title == "menerima"
                              ? AppFont.textNotificationActive
                              : AppFont.textNotificationError,
                        ),
                        TextSpan(
                          text: widget.notif.notifType == "collab"
                              ? " catatan anda"
                              : " undangan tim anda",
                          style: AppFont.medium14,
                        ),
                        TextSpan(
                          text: "\n ${widget.notif.send}",
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
                      widget.notif.notifType == "team"
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
                          widget.notif.senderPlace == 0
                              ? 'Team / Notes tidak ada'
                              : widget.notif.placeName,
                          style: AppFont.textInvitation,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
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