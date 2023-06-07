import 'dart:convert';

import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/screens/note/notes_detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/note_model.dart';

class CardMyNotesPersonal extends StatelessWidget {
  final NoteDetailModel noteDetail;
  CardMyNotesPersonal({required this.noteDetail});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        String name = prefs.getString('username').toString();
        bool isOwner = false;
        if (name == noteDetail.owner.username) {
          isOwner = true;
        }
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NotesDetail(
                noteDetail: noteDetail,
                isOwner: isOwner,
              ),
            ));
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
                              noteDetail.subject,
                              style: AppFont.semiBold16w500,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                              color: noteDetail.status != '0%'
                                  ? AppColor.completeColor
                                  : AppColor.zeroColor,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Text(noteDetail.status,
                                style: noteDetail.status != '0%'
                                    ? AppFont.textUploadDone
                                    : AppFont.textUploadError
                                // TextStyle(
                                //   fontStyle: FontStyle.normal,
                                //   color: noteDetail.status == '0%'
                                //       ? AppColor.errorColor
                                //       : AppColor.textprogresColor,
                                // ),
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        noteDetail.description,
                        style: AppFont.regular12,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          // noteDetail.owner[0].photo != null
                          //     ? CachedNetworkImage(
                          //         imageUrl: noteDetail.owner[0].photo,
                          //         placeholder: (context, url) =>
                          //             CircularProgressIndicator(),
                          //         errorWidget: (context, url, error) =>
                          //             const Icon(Icons.error),
                          //         imageBuilder: (context, imageProvider) =>
                          //             CircleAvatar(
                          //           backgroundImage: imageProvider,
                          //           radius: 10.0,
                          //         ),
                          //       )
                          //     : CachedNetworkImage(
                          //         imageUrl: imageUrl,
                          //         placeholder: (context, url) =>
                          //             CircularProgressIndicator(),
                          //         errorWidget: (context, url, error) =>
                          //             const Icon(Icons.error),
                          //         imageBuilder: (context, imageProvider) =>
                          //             CircleAvatar(
                          //           backgroundImage: imageProvider,
                          //           radius: 10.0,
                          //         ),
                          //       ),
                          CachedNetworkImage(
                            imageUrl:
                                'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
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
                            noteDetail.owner.username,
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
                          // noteDetail.eventDate.toString(),
                          DateFormat('dd MMMM yyyy', 'id_ID')
                              .format(noteDetail.eventDate),
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
