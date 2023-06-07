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

  // final String user;
  // final String status;
  // final int time;
  // final String subject;
  // final bool accepted;
  // final bool? tim;

  // final String title;
  // final String body;
  // final String recipient;
  // final bool read;
  // final String sender;
  // final String senderPlace;

  const CardNotification({
    super.key,
    // required this.user,
    // required this.status,
    // required this.time,
    // required this.subject,
    // required this.accepted,
    // this.tim,
    required this.notif,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
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
                    'https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg?w=900&t=st=1680684886~exp=1680685486~hmac=b9176641b65dc64df37ed7f0cfba49259ea8908fbe7bd96cecc07b7d42e46633',
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
                height: 50,
                child: RichText(
                  overflow: TextOverflow.visible,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: notif.sender,
                        style: AppFont.semiBold14,
                      ),
                      TextSpan(
                        text: notif.read == true ? " menerima " : " menolak ",
                        style: notif.read == true
                            ? AppFont.textNotificationActive
                            : AppFont.textNotificationError,
                      ),
                      TextSpan(
                        text: " catatan anda",
                        style: AppFont.medium14,
                      ),
                      TextSpan(
                        text: "\n ${notif.body} menit lalu",
                        style: AppFont.textNotificationTime,
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  notif.senderPlace != null
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
                  Text(
                    notif.title,
                    style: AppFont.textInvitation,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
