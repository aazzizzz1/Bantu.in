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

class NotesDetail extends StatelessWidget {
  final String title;
  final String description;
  final String avatarUrl;
  final String name;
  final String fileUrl;
  final String createdBy;
  final String eventDate;
  final String reminder;
  final String ringtone;
  final double? progress;
  final bool? isAdmin;
  final bool? isPersonal;
  final bool? isUpload;
  // final NoteModel notes;

  NotesDetail({
    required this.title,
    required this.description,
    required this.avatarUrl,
    required this.name,
    required this.fileUrl,
    required this.createdBy,
    required this.eventDate,
    required this.reminder,
    required this.ringtone,
    this.progress,
    this.isAdmin,
    this.isPersonal,
    this.isUpload,
  });

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
          isPersonal == null
              ? (isAdmin == true
                  ? AdminAppbar(
                      progress: progress,
                    )
                  : ClientUploadStatus(isUpload: isUpload!))
              : const SizedBox()
        ],
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
                        title,
                        style: AppFont.textTitleScreen,
                      ),
                      isPersonal == true || isAdmin == true
                          ? EditDeleteNote(
                              title: title,
                              description: description,
                              avatarUrl: avatarUrl,
                              name: name,
                              fileUrl: fileUrl,
                              createdBy: createdBy,
                              eventDate: eventDate,
                              reminder: reminder,
                              ringtone: ringtone,
                              isAdmin: isAdmin,
                            )
                          : const SizedBox(),
                    ],
                  ),
                  SizedBox(height: 20.0),
                  SizedBox(
                    width: 250,
                    child: Text(
                      description,
                      style: AppFont.medium14,
                      maxLines: 5,
                    ),
                  ),
                  SizedBox(height: 24.0),
                  isAdmin != null
                      ? (isAdmin == true
                          ? AdminMember(fileUrl: fileUrl)
                          : ClientDate(
                              eventDate: eventDate, reminder: reminder))
                      : const SizedBox(),
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
                            imageUrl: avatarUrl,
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
                            createdBy,
                            style: AppFont.textPersonOrTeam,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  isPersonal == true || isAdmin == true
                      ? AdminDate(
                          eventDate: eventDate,
                          reminder: reminder,
                          ringtone: ringtone)
                      : const ClientUpload(),
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
                    child: Center(
                        child: isPersonal == true || isAdmin == true
                            ? Text(
                                'Selesaikan Catatan',
                                style: AppFont.textFillButtonActive,
                              )
                            : Text(
                                'Simpan',
                                style: AppFont.textFillButtonActive,
                              )),
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
