import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/screens/note/tracking_screen.dart';
import 'package:bantuin/widgets/detail_note/admin_appbar.dart';
import 'package:bantuin/widgets/detail_note/admin_date.dart';
import 'package:bantuin/widgets/detail_note/admin_member.dart';
import 'package:bantuin/widgets/detail_note/client_date.dart';
import 'package:bantuin/widgets/detail_note/client_upload.dart';
import 'package:bantuin/widgets/detail_note/client_upload_status.dart';
import 'package:bantuin/widgets/detail_note/edit_delete_note.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/note_model.dart';

class NotesDetail extends StatelessWidget {
  final NoteDetailModel noteDetail;
  final bool isOwner;

  NotesDetail({required this.noteDetail, required this.isOwner});

  @override
  Widget build(BuildContext context) {
    // Future<bool> isOwner() async {
    //   var prefs = await SharedPreferences.getInstance();
    //   String name = prefs.getString('username').toString().toLowerCase();

    //   if (noteDetail.owner[0].username == name) {
    //     print(name);
    //     return false;
    //   } else {
    //     return true;
    //   }
    // }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 76,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.black,
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            child: Text(
              noteDetail.status,
              style: AppFont.textProgressComplete,
            ),
          )
        ],

        // actions: [
        //   isPersonal == null
        //       ? (isAdmin == true
        //           ? AdminAppbar(
        //               progress: progress,
        //             )
        //           : ClientUploadStatus(isUpload: isUpload!))
        //       : const SizedBox()
        // ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 60,
          margin: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Text(
                          noteDetail.subject,
                          style: AppFont.textTitleScreen,
                        ),
                      ),
                      isOwner
                          ? EditDeleteNote(note: noteDetail)
                          : const SizedBox(),
                      // noteDetail.notesType == "personal"
                      //     ? EditDeleteNote(
                      //         note: noteDetail,
                      //       )
                      //     : const SizedBox(),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width: 250,
                    child: Text(
                      noteDetail.description,
                      style: AppFont.medium14,
                      maxLines: 5,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  noteDetail.notesType == 'personal'
                      ? const SizedBox()
                      : isOwner == true
                          ? AdminMember(noteDetail: noteDetail)
                          : ClientDate(
                              eventDate: noteDetail.eventDate,
                              reminder: noteDetail.reminder),
                  const SizedBox(height: 16.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Pembuat Catatan :',
                        style: AppFont.medium14,
                      ),
                      SizedBox(height: 8.0),
                      Row(
                        children: [
                          CachedNetworkImage(
                            imageUrl:
                                'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                            imageBuilder: (context, imageProvider) =>
                                CircleAvatar(
                              backgroundImage: imageProvider,
                              radius: 12.0,
                            ),
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            noteDetail.owner[0].username,
                            style: AppFont.textPersonOrTeam,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  noteDetail.notesType == "personal"
                      ? AdminDate(
                          eventDate: DateFormat('dd MMMM yyyy', 'id_ID')
                              .format(noteDetail.eventDate),
                          reminder: DateFormat('dd MMMM yyyy', 'id_ID')
                              .format(noteDetail.reminder),
                          ringtone: noteDetail.ringtone)
                      : isOwner
                          ? const SizedBox()
                          : const ClientUpload(),
                ],
              ),
              SizedBox(
                height: 48,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(
                        EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                      ),
                      elevation: MaterialStatePropertyAll(0),
                      backgroundColor:
                          MaterialStatePropertyAll(AppColor.activeColor),
                    ),
                    child: Center(
                      child: isOwner
                          ? Text(
                              'Selesaikan Catatan',
                              style: AppFont.textFillButtonActive,
                            )
                          : Text(
                              'Simpan',
                              style: AppFont.textFillButtonActive,
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
