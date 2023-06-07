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

class CardMyNotesClient extends StatelessWidget {
  final NoteDetailModel noteDetail;

  CardMyNotesClient({required this.noteDetail});

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
                    id: noteDetail.id,
                  ),
                ));
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
                                  noteDetail.subject,
                                  style: AppFont.semiBold16w500,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  color: noteDetail.status != 'not_upload_yet'
                                      ? AppColor.completeColor
                                      : AppColor.zeroColor,
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Text(
                                  noteDetail.status != 'not_upload_yet'
                                      ? 'Sudah Upload'
                                      : 'Belum Upload',
                                  style: noteDetail.status != 'not_upload_yet'
                                      ? AppFont.textUploadDone
                                      : AppFont.textUploadError,
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
                              ),
                            ],
                          ),
                          Container(
                            child: Text(
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
      },
    );
  }
}
