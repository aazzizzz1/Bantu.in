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

import '../../models/note_model.dart';

class NotesDetail extends StatelessWidget {
  final NoteDetailModel noteDetail;

  NotesDetail({required this.noteDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Text(
            noteDetail.status,
            style: AppFont.textProgressComplete,
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
                    children: [
                      Text(
                        noteDetail.subject,
                        style: AppFont.textTitleScreen,
                      ),
                      noteDetail.notesType == "personal"
                          ? EditDeleteNote(
                              note: noteDetail,
                            )
                          : const SizedBox(),
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
                  SizedBox(height: 24.0),
                  // AdminMember(fileUrl: avatarUrl),
                  // isAdmin != null
                  //     ? (isAdmin == true
                  //         ? AdminMember(fileUrl: fileUrl)
                  //         : ClientDate(
                  //             eventDate: eventDate, reminder: reminder))
                  //     : const SizedBox(),
                  SizedBox(height: 16.0),
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
                  AdminDate(
                      eventDate: DateFormat('dd MMMM yyyy', 'id_ID')
                          .format(noteDetail.eventDate),
                      reminder: DateFormat('dd MMMM yyyy', 'id_ID')
                          .format(noteDetail.reminder),
                      ringtone: noteDetail.ringtone)
                  // isPersonal == true || isAdmin == true
                  //     ? AdminDate(
                  //         eventDate: eventDate,
                  //         reminder: reminder,
                  //         ringtone: ringtone)
                  //     : const ClientUpload(),
                  // isAdmin != null
                  //     ? (isAdmin == true ? adminWidgetDate() : clientUpload())
                  //     : const SizedBox(),
                ],
              ),
              SizedBox(
                height: 48,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                      onPressed: () {
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //     SnackBar(content: Text("Catatan Diselesaikan")));
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
                      child: Text('Selesaikan Catatan')
                      // Center(
                      //     child: isPersonal == true || isAdmin == true
                      //         ? Text(
                      //             'Selesaikan Catatan',
                      //             style: AppFont.textFillButtonActive,
                      //           )
                      //         : Text(
                      //             'Simpan',
                      //             style: AppFont.textFillButtonActive,
                      //           )),
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
