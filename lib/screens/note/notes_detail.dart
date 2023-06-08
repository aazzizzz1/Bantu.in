import 'dart:io';

import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/models/file_note_client.dart';
import 'package:bantuin/models/note_detail_client_model.dart';
import 'package:bantuin/screens/note/tracking_screen.dart';
import 'package:bantuin/view_models/history_viewmodel.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
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
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/note_model.dart';
import '../../utils/app_state.dart';
import '../../widgets/detail_note/client_upload2.dart';
import '../../widgets/shimmer_loading/shimmer_container.dart';

class NotesDetail extends StatefulWidget {
  final NoteDetailModel noteDetail;
  final bool isOwner;
  final bool? isUpload;

  NotesDetail({
    required this.noteDetail,
    required this.isOwner,
    this.isUpload,
  });

  @override
  State<NotesDetail> createState() => _NotesDetailState();
}

class _NotesDetailState extends State<NotesDetail> {
  List<File> _fileUrl = [];
  List<PlatformFile> platformFileUrl = [];
  late List status;
  bool isUpload = false;
  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() => Provider.of<NoteViewModel>(context, listen: false)
        .getDetailNoteAdmin(widget.noteDetail.id));
    Future.microtask(() => Provider.of<HistoryViewModel>(context, listen: false)
        .fetchHistory(widget.noteDetail));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double heightAdmin = MediaQuery.of(context).size.height - 60;
    double heightClient = MediaQuery.of(context).size.height;

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
          Consumer<NoteViewModel>(
            builder: (context, value, child) {
              if (value.appState == AppState.loading) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
                  child: ShimmerContainer.circular(
                      height: 30,
                      width: 90,
                      shapeBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                );
              }
              if (value.appState == AppState.loaded) {
                return AdminAppbar(
                  progress: widget.noteDetail.status,
                );
              }
              if (value.appState == AppState.noData) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('null'),
                );
              }
              if (value.appState == AppState.failure) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('null'),
                );
              }
              return const SizedBox();
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<NoteViewModel>(
          builder: (context, noteView, child) {
            if (noteView.appState == AppState.loading) {
              return _loadingContainer();
            }
            if (noteView.appState == AppState.loaded) {
              return Container(
                height: widget.isOwner ? heightAdmin : heightClient,
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
                                noteView.noteDetailAdmin.subject,
                                style: AppFont.textTitleScreen,
                              ),
                            ),
                            EditDeleteNote(note: noteView.noteDetailAdmin)
                          ],
                        ),
                        SizedBox(height: 20.0),
                        SizedBox(
                          width: 250,
                          child: Text(
                            noteView.noteDetailAdmin.description,
                            style: AppFont.medium14,
                            maxLines: 5,
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        noteView.noteDetailAdmin.notesType == 'collaboration'
                            ? AdminMember(noteDetail: noteView.noteDetailAdmin)
                            : const SizedBox(),
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
                                  imageUrl: widget.noteDetail.owner.photo,
                                  // imageUrl:
                                  //     'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                  // placeholder: (context, url) =>
                                  //     CircularProgressIndicator(),
                                  // errorWidget: (context, url, error) =>
                                  //     Icon(Icons.error),
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                    backgroundImage: imageProvider,
                                    radius: 12.0,
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  noteView.noteDetailAdmin.owner.username,
                                  style: AppFont.textPersonOrTeam,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 24.0),
                        AdminDate(
                            eventDate:
                                DateFormat('dd MMMM yyyy hh:mm aa', 'id_ID')
                                    .format(noteView.noteDetailAdmin.eventDate),
                            reminder:
                                DateFormat('dd MMMM yyyy hh:mm aa', 'id_ID')
                                    .format(noteView.noteDetailAdmin.reminder),
                            ringtone: noteView.noteDetailAdmin.ringtone),
                      ],
                    ),
                    SizedBox(
                      height: 48,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: noteView.noteDetailAdmin.notesType == 'personal'
                            ? ElevatedButton(
                                onPressed: noteView.noteDetailAdmin.status ==
                                        "completed"
                                    ? null
                                    : () async {
                                        try {
                                          await noteView.completeNote(
                                              'completed', widget.noteDetail);

                                          setState(() {});
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                title: Text(
                                                  'Selamat, anda telah menyelesaikan catatan ini',
                                                  textAlign: TextAlign.center,
                                                  style: AppFont
                                                      .textSubjectOrTitle,
                                                ),
                                                content: Text(
                                                  'Anda mendapatkan point sebesar 100. Semangat terus mengerjakan tugasnya.',
                                                  textAlign: TextAlign.center,
                                                  style:
                                                      AppFont.textDescription,
                                                ),
                                                actionsPadding:
                                                    const EdgeInsets.only(
                                                        left: 18,
                                                        right: 18,
                                                        bottom: 16),
                                                actions: [
                                                  ElevatedButton(
                                                    onPressed: () async {
                                                      try {
                                                        await noteView
                                                            .earnedPoint(widget
                                                                .noteDetail)
                                                            .then((value) =>
                                                                Fluttertoast
                                                                    .showToast(
                                                                        msg:
                                                                            'Horeeeee!!!!!'))
                                                            .then((value) =>
                                                                Navigator.pop(
                                                                    context));
                                                      } catch (e) {
                                                        await Fluttertoast
                                                            .showToast(
                                                                msg: e
                                                                    .toString());
                                                      }
                                                      setState(() {});
                                                    },
                                                    style: const ButtonStyle(
                                                      padding:
                                                          MaterialStatePropertyAll(
                                                              EdgeInsets.all(
                                                                  16.0)),
                                                      elevation:
                                                          MaterialStatePropertyAll(
                                                              0),
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              AppColor
                                                                  .activeColor),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Terima',
                                                        style: AppFont
                                                            .textFillButtonActive,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                          // await noteView
                                          //     .completeNote('completed',
                                          //         widget.noteDetail)
                                          //     .then((value) =>
                                          //         Fluttertoast.showToast(
                                          //             msg: 'Catatan selesai'))
                                          //     .then((value) =>
                                          //         Navigator.pop(context));
                                        } catch (e) {
                                          await Fluttertoast.showToast(
                                              msg: e.toString());
                                        }
                                      },
                                style: ButtonStyle(
                                  padding: const MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        horizontal: 100, vertical: 15),
                                  ),
                                  elevation: const MaterialStatePropertyAll(0),
                                  backgroundColor: MaterialStatePropertyAll(
                                      widget.noteDetail.status == "completed"
                                          ? AppColorNeutral.neutral2
                                          : AppColor.activeColor),
                                ),
                                child: Center(
                                  child: Text(
                                    'Selesaikan Catatan',
                                    style: AppFont.textFillButtonActive,
                                  ),
                                ),
                              )
                            : ElevatedButton(
                                onPressed: noteView.noteDetailAdmin.status !=
                                        "100%"
                                    ? null
                                    : () async {
                                        try {
                                          await noteView
                                              .completeNote('completed',
                                                  widget.noteDetail)
                                              .then((value) =>
                                                  Fluttertoast.showToast(
                                                      msg: 'Catatan selesai'))
                                              .then((value) =>
                                                  Navigator.pop(context));
                                        } catch (e) {
                                          await Fluttertoast.showToast(
                                              msg: e.toString());
                                        }
                                      },
                                style: ButtonStyle(
                                  padding: const MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        horizontal: 100, vertical: 15),
                                  ),
                                  elevation: const MaterialStatePropertyAll(0),
                                  backgroundColor: MaterialStatePropertyAll(
                                      widget.noteDetail.status != "100%"
                                          ? AppColorNeutral.neutral2
                                          : AppColor.activeColor),
                                ),
                                child: Center(
                                  child: Text(
                                    'Selesaikan Catatan',
                                    style: AppFont.textFillButtonActive,
                                  ),
                                ),
                              ),
                      ),
                    ),
                    // Consumer<NoteViewModel>(
                    //   builder: (context, value, child) =>
                    //   ,
                    // ),
                  ],
                ),
              );
            }
            if (noteView.appState == AppState.noData) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  'Detail kosong',
                  style: AppFont.textScreenEmpty,
                ),
              );
            }
            if (noteView.appState == AppState.failure) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  'Gagal mengambil detail catatan',
                  style: AppFont.textScreenEmpty,
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _loadingContainer() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ShimmerContainer.rectangle(height: 50, width: 200),
          const SizedBox(height: 16),
          const ShimmerContainer.rectangle(height: 30, width: 120),
          const SizedBox(height: 16),
          const Divider(
            thickness: 1,
            color: AppColorNeutral.neutral2,
          ),
          const SizedBox(height: 16),
          const ShimmerContainer.rectangle(height: 20, width: 120),
          const SizedBox(height: 10),
          const ShimmerContainer.rectangle(height: 20, width: 120),
          const SizedBox(height: 16),
          const Divider(
            thickness: 1,
            color: AppColorNeutral.neutral2,
          ),
          const SizedBox(height: 16),
          Row(
            children: const [
              ShimmerContainer.circular(height: 20, width: 20),
              SizedBox(width: 16),
              ShimmerContainer.rectangle(height: 20, width: 120),
            ],
          ),
        ],
      ),
    );
  }
}
