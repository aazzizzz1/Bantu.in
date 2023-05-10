import 'dart:convert';

import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/screens/note/notes_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class CardMyNotesPersonal extends StatelessWidget {
  final String subject;
  final String description;
  final String date;
  final String avatarUrl;
  final String member;
  final String status;

  CardMyNotesPersonal({
    required this.subject,
    required this.description,
    required this.date,
    required this.avatarUrl,
    required this.member,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotesDetail(
                  subject: subject,
                  description: description,
                  date: date,
                  avatarUrl: avatarUrl,
                  member: member,
                  status: status),
            )
            // MaterialPageRoute(
            //   builder: (context) => NotesDetail(
            //     title: 'Meeting with John Doe',
            //     description: 'Meeting with John Doe to discuss about the project',
            //     avatarUrl:
            //         'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
            //     name: 'John Doe',
            //     fileUrl: 'https://example.com/notes.pdf',
            //     createdBy: 'John Doe',
            //     eventDate: '2023-04-08',
            //     reminder: '2023-04-07 10:00:00',
            //     ringtone: 'default',
            //     isUpload: true,
            //     isPersonal: true,
            //   ),
            // ),
            );
      },
      child: Container(
        height: 135,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(16.0),
        ),
        padding: const EdgeInsets.all(10.0),
        margin: const EdgeInsets.only(bottom: 16.0),
        child: Row(
          // after
          // children: [
          //   SizedBox(
          //     width: 60,
          //     child: ListView.builder(
          //       shrinkWrap: true,
          //       scrollDirection: Axis.horizontal,
          //       itemCount: member.length,
          //       itemBuilder: (context, index) => Text(
          //         member[index],
          //         style: AppFont.regular12,
          //       ),
          //     ),
          //   ),
          // ],

          children: [
            Container(
              margin: const EdgeInsets.all(8),
              child: SvgPicture.asset('lib/assets/icons/User.svg',
                  color: AppColorPrimary.primary6),
            ),
            const VerticalDivider(
              width: 5,
              color: AppColorNeutral.neutral2,
              thickness: 1.5,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              subject,
                              style: AppFont.semiBold16w500,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: AppColor.completeColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(
                              status,
                              style: TextStyle(
                                fontStyle: FontStyle.normal,
                                color: AppColor.textprogresColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        description,
                        style: AppFont.regular12,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl: avatarUrl,
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
                              backgroundImage: imageProvider,
                              radius: 10.0,
                            ),
                          ),
                          const SizedBox(width: 8.0),
                          Text(
                            member,
                            style: AppFont.regular12,
                          )
                          // SizedBox(
                          //   width: 60,
                          //   child: ListView.builder(
                          //     shrinkWrap: true,
                          //     scrollDirection: Axis.horizontal,
                          //     itemCount: member.length,
                          //     itemBuilder: (context, index) => Text(
                          //       member[index],
                          //       style: AppFont.regular12,
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                      Container(
                        child: Text(
                          '$date',
                          // DateFormat('dd MMMM yyyy', 'id_ID').format(date),
                          style: AppFont.regular12,
                        ),
                      ),
                    ],
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
