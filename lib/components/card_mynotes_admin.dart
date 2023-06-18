import 'dart:async';

import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/screens/note/notes_detail.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/note/note_detail_client.dart';

class CardMyNotesAdmin extends StatefulWidget {
  final NoteDetailModel noteDetail;

  CardMyNotesAdmin({required this.noteDetail});

  @override
  State<CardMyNotesAdmin> createState() => _CardMyNotesAdminState();
}

class _CardMyNotesAdminState extends State<CardMyNotesAdmin> {
  // bool isHalf = false;
  // bool isFull = false;
  // bool isCompleted = false;
  // late String sts = widget.noteDetail.status;
  // late String statusComplete = widget.noteDetail.status;
  // late double status;
  @override
  void initState() {
    // TODO: implement initState
    // print(status);
    // if (statusComplete != 'completed') {
    //   status = double.parse(sts.substring(0, sts.lastIndexOf('%')));
    // }
    // if (status > 49) {
    //   isHalf = true;
    // }
    // if (status == 100) {
    //   isFull = true;
    // }
    // if (widget.noteDetail.status == 'completed') {
    //   isCompleted = true;
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pesan = widget.noteDetail.description.length;

    return Consumer<NoteViewModel>(
      builder: (context, noteView, child) {
        return GestureDetector(
          onTap: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            String name = prefs.getString('username').toString();
            bool isOwner = false;
            if (name == widget.noteDetail.owner.username) {
              isOwner = true;
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NotesDetail(
                    noteDetail: widget.noteDetail,
                    isOwner: isOwner,
                  ),
                )).then((value) {
              noteView.filterUpcomingNote();
              noteView.filterPassedNote();
            });
          },
          child: Container(
            height: (pesan > 230 && pesan < 350)
                ? MediaQuery.of(context).size.height * 0.21
                : (pesan > 180 && pesan < 230)
                    ? MediaQuery.of(context).size.height * 0.19
                    : MediaQuery.of(context).size.height * 0.18,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: const EdgeInsets.all(10.0),
            margin: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.all(8),
                  child: SvgPicture.asset(
                    'lib/assets/icons/Group.svg',
                    alignment: Alignment.centerLeft,
                    allowDrawingOutsideViewBox: true,
                    color: AppColorPrimary.primary6,
                  ),
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
                                  widget.noteDetail.subject,
                                  style: AppFont.semiBold16w500,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: widget.noteDetail.status == '0%'
                                      ? AppColor.zeroToHalf
                                      : widget.noteDetail.status == '100%'
                                          ? AppColor.completeColor
                                          : widget.noteDetail.status ==
                                                  'completed'
                                              ? AppColorPrimary.primary2
                                              : AppColor.halfToFull,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  widget.noteDetail.status != 'completed'
                                      ? widget.noteDetail.status
                                      : 'Catatan selesai',
                                  style: widget.noteDetail.status == '0%'
                                      ? AppFont.textUploadError
                                      : widget.noteDetail.status == '100%'
                                          ? AppFont.textUploadDone
                                          : widget.noteDetail.status ==
                                                  'completed'
                                              ? AppFont.textCompletedNote
                                              : AppFont.textHalfStatusNote,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          SizedBox(
                            height: 40,
                            child: Text(
                              widget.noteDetail.description,
                              style: AppFont.regular12,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: widget.noteDetail.owner.photo,
                                // placeholder: (context, url) =>
                                //     const CircularProgressIndicator(),
                                // errorWidget: (context, url, error) =>
                                //     const Icon(Icons.error),
                                imageBuilder: (context, imageProvider) =>
                                    CircleAvatar(
                                  backgroundImage: imageProvider,
                                  radius: 10.0,
                                ),
                              ),
                              const SizedBox(width: 8.0),
                              Text(
                                widget.noteDetail.owner.username,
                                style: AppFont.regular12,
                              ),
                            ],
                          ),
                          Container(
                            child: Text(
                              // noteDetail.eventDate.toString(),
                              DateFormat('dd MMMM yyyy', 'id_ID')
                                  .format(widget.noteDetail.eventDate),
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
      },
    );
  }
}
