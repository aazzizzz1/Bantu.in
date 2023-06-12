import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/screens/note/notes_detail.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/note/note_detail_client.dart';

class CardMyNotesClient extends StatefulWidget {
  final NoteDetailModel noteDetail;

  CardMyNotesClient({required this.noteDetail});

  @override
  State<CardMyNotesClient> createState() => _CardMyNotesClientState();
}

class _CardMyNotesClientState extends State<CardMyNotesClient> {
  bool isLate = false;
  bool isCompleted = false;
  bool isUpload = false;

  @override
  void initState() {
    // TODO: implement initState
    switch (widget.noteDetail.status) {
      case 'late':
        isLate = true;
        break;
      case 'completed':
        isCompleted = true;
        break;
      case 'have_upload':
        isUpload = true;
        break;
      default:
        isUpload = false;
        isCompleted = false;
        isLate = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteViewModel>(
      builder: (context, note, child) {
        return GestureDetector(
          onTap: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NoteDetailClient(
                    id: widget.noteDetail.id,
                    status: widget.noteDetail.status,
                  ),
                )).then((value) {
              note.filterUpcomingNote();
              note.filterPassedNote();
            });
            // try {
            //   ;
            // } catch (e) {
            //   await Fluttertoast.showToast(msg: e.toString());
            // }
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
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: isUpload
                                      ? isCompleted
                                          ? AppColorPrimary.primary2
                                          : AppColor.completeColor
                                      : AppColor.zeroToHalf,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  isUpload
                                      ? isCompleted
                                          ? 'Catatan Selesai'
                                          : 'Sudah Upload'
                                      : isLate
                                          ? 'Anda Telat'
                                          : 'Belum Upload',
                                  style: isUpload
                                      ? isCompleted
                                          ? AppFont.textCompletedNote
                                          : AppFont.textUploadDone
                                      : AppFont.textUploadError,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8.0),
                          SizedBox(
                            height: 50,
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
