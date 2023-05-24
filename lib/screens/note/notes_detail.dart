import 'dart:io';

import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/models/file_note_client.dart';
import 'package:bantuin/screens/note/tracking_screen.dart';
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
import '../../widgets/detail_note/client_upload2.dart';

class NotesDetail extends StatefulWidget {
  final NoteDetailModel noteDetail;
  final bool isOwner;
  final bool? isUpload;

  NotesDetail({required this.noteDetail, required this.isOwner, this.isUpload});

  @override
  State<NotesDetail> createState() => _NotesDetailState();
}

class _NotesDetailState extends State<NotesDetail> {
  List<File> _fileUrl = [];
  List<PlatformFile> platformFileUrl = [];
  @override
  Widget build(BuildContext context) {
    double heightAdmin = MediaQuery.of(context).size.height - 60;
    double heightClient = MediaQuery.of(context).size.height;

    void _handleFileSelected(
        List<File> selectedFile, List<PlatformFile> selectedPlatformFile) {
      print("coba cek" + selectedPlatformFile.toString());
      _fileUrl = selectedFile;
      platformFileUrl = selectedPlatformFile;
      // setState(() {
      // });
    }

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
          widget.isOwner == true
              ? const AdminAppbar(
                  progress: 0,
                )
              : ClientUploadStatus(isUpload: false)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
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
                          widget.noteDetail.subject,
                          style: AppFont.textTitleScreen,
                        ),
                      ),
                      widget.isOwner
                          ? EditDeleteNote(note: widget.noteDetail)
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
                      widget.noteDetail.description,
                      style: AppFont.medium14,
                      maxLines: 5,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  widget.noteDetail.notesType == 'personal'
                      ? const SizedBox()
                      : widget.isOwner == true
                          ? AdminMember(noteDetail: widget.noteDetail)
                          : ClientDate(
                              eventDate: widget.noteDetail.eventDate,
                              reminder: widget.noteDetail.reminder),
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
                            widget.noteDetail.owner[0].username,
                            style: AppFont.textPersonOrTeam,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 24.0),
                  widget.noteDetail.notesType == "personal"
                      ? AdminDate(
                          eventDate: DateFormat('dd MMMM yyyy', 'id_ID')
                              .format(widget.noteDetail.eventDate),
                          reminder: DateFormat('dd MMMM yyyy', 'id_ID')
                              .format(widget.noteDetail.reminder),
                          ringtone: widget.noteDetail.ringtone)
                      : widget.isOwner
                          ? const SizedBox()
                          : clientUpload()
                  // : ClientUploadFile2(onChanged: _handleFileSelected),
                ],
              ),
              Consumer<NoteViewModel>(
                builder: (context, value, child) => SizedBox(
                  height: 48,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: widget.isOwner
                        ? ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: const ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 15),
                              ),
                              elevation: MaterialStatePropertyAll(0),
                              backgroundColor: MaterialStatePropertyAll(
                                  AppColor.activeColor),
                            ),
                            child: Center(
                              child: Text(
                                'Selesaikan Catatan',
                                style: AppFont.textFillButtonActive,
                              ),
                            ),
                          )
                        : ElevatedButton(
                            onPressed: () async {
                              // Navigator.pop(context);
                              print('simpan' + _fileUrl.toString());
                              try {
                                await value
                                    .uploadFileClient(
                                        id: widget.noteDetail.id.toString(),
                                        selectedFile: _fileUrl)
                                    .then((value) => Fluttertoast.showToast(
                                        msg: 'Berhasil Upload File'))
                                    .then((value) => Navigator.pop(context));
                              } catch (e) {
                                await Fluttertoast.showToast(msg: e.toString());
                              }
                            },
                            style: const ButtonStyle(
                              padding: MaterialStatePropertyAll(
                                EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 15),
                              ),
                              elevation: MaterialStatePropertyAll(0),
                              backgroundColor: MaterialStatePropertyAll(
                                  AppColor.activeColor),
                            ),
                            child: Center(
                              child: Text(
                                'Simpan',
                                style: AppFont.textFillButtonActive,
                              ),
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

  Widget clientUpload() {
    void _pickFile() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png', 'pdf'],
      );

      if (result != null && result.files.single.path != null) {
        /// Load result and file details
        PlatformFile file = result.files.first;
        print(file.name);
        print(file.bytes);
        print(file.size);
        print(file.extension);
        print(file.path);

        /// normal file
        File _file = File(result.files.single.path!);
        setState(() {
          platformFileUrl.add(result.files.first);
          _fileUrl.add(_file);
        });
      } else {
        /// User canceled the picker
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Upload bukti",
          style: AppFont.semiBold14,
        ),
        const SizedBox(height: 8),
        Text(
          "File yang support adalah .jpg atau .png .pdf",
          style: AppFont.medium14,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () async {
            _pickFile();
          },
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(AppColorNeutral.neutral2),
            padding: MaterialStateProperty.all(
              const EdgeInsets.symmetric(vertical: 10),
            ),
            elevation: MaterialStateProperty.all(0),
            side: MaterialStateProperty.all(
              const BorderSide(color: AppColorNeutral.neutral2),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          child: Container(
            alignment: Alignment.center,
            width: 150,
            height: 30,
            child: Text(
              'Upload File',
              style: AppFont.cancelText,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        _fileUrl.isEmpty
            ? const SizedBox()
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "File yang telah diunggah",
                        style: AppFont.semiBold14,
                      ),
                      TextButton(
                        onPressed: () {
                          // Action to perform when the button is pressed
                        },
                        child: Text('Lihat Semua'),
                      ),
                    ],
                  ),
                  openFiles(platformFileUrl),
                ],
              ),
      ],
    );
  }

  Widget openFiles(List<PlatformFile> files) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: files.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final dataFile = files[index];
            return GestureDetector(
              onTap: () {
                OpenFile.open(dataFile.path);
              },
              child: Container(
                height: 56,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColorNeutral.neutral2,
                ),
                child: Text(
                  dataFile.name,
                  style: AppFont.regular12,
                ),
              ),
            );
          }),
    );
  }
}
