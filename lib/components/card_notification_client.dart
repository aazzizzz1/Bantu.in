import 'dart:ffi';

import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/models/notification.dart';
import 'package:bantuin/view_models/notification_viewmodel.dart';
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

class CardNotificationClient extends StatefulWidget {
  final DetailNotificationModel notif;
//  final NoteModel note;

  const CardNotificationClient({
    super.key,
    required this.notif,
    // required this.note,
  });

  @override
  State<CardNotificationClient> createState() => _CardNotificationClientState();
}

class _CardNotificationClientState extends State<CardNotificationClient> {
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Future.microtask(() =>
  //       Provider.of<NotificationViewModel>(context, listen: false)
  //           .getDetailNoteNotif(widget.notif.senderPlace));
  // }

  @override
  Widget build(BuildContext context) {
    final pesan = widget.notif.body.length;
    // int id = notif.senderPlace;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      height: pesan > 180
          ? MediaQuery.of(context).size.height * 0.32
          : MediaQuery.of(context).size.height * 0.22,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(12),
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
          Expanded(
            // Menggunakan Expanded untuk mengatur tinggi kontainer
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  // Menggunakan Flexible untuk mengatur tinggi pada RichText
                  child: RichText(
                    overflow: TextOverflow.visible,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: widget.notif.sender,
                          style: AppFont.semiBold14,
                        ),
                        TextSpan(
                          text: " ${widget.notif.title}",
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
                      widget.notif.notifType == 'client'
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
                if (widget.notif.notifType == 'client')
                  Flexible(
                    // Menggunakan Flexible untuk mengatur tinggi pada RichText
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width - 100,
                      child: RichText(
                        overflow: TextOverflow.visible,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Pesan :",
                              style: AppFont.semiBold14,
                            ),
                            TextSpan(
                              text: " ${widget.notif.body}",
                              style: AppFont.medium14,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
