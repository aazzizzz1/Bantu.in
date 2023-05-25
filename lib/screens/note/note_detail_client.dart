import 'dart:io';

import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/screens/note/file_preview_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file/open_file.dart';
import 'package:provider/provider.dart';

import '../../constants/constant.dart';
import '../../models/note_detail_client_model.dart';
import '../../view_models/note_detail_viewmodel.dart';
import '../../view_models/note_viewmodel.dart';
import '../../widgets/detail_note/client_date.dart';
import '../../widgets/detail_note/client_upload_status.dart';

class NoteDetailClient extends StatefulWidget {
  final NoteDetailClientModel noteDetail;
  const NoteDetailClient({super.key, required this.noteDetail});

  @override
  State<NoteDetailClient> createState() => _NoteDetailClientState();
}

class _NoteDetailClientState extends State<NoteDetailClient> {
  List<File> _fileUrl = [];
  List<PlatformFile> platformFileUrl = [];
  bool isUpload = false;
  bool isActive = false;

  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() => Provider.of<NoteViewModel>(context, listen: false)
        .getDetailNote(widget.noteDetail.id));
    if (widget.noteDetail.file.isNotEmpty) {
      isUpload = true;
    }
    if (platformFileUrl.isNotEmpty || widget.noteDetail.file.isNotEmpty) {
      setState(() {
        isActive = true;
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
        actions: [ClientUploadStatus(isUpload: isUpload)],
      ),
      body: SingleChildScrollView(
        child: Consumer<NoteViewModel>(
          builder: (context, value, child) {
            return Container(
              height: heightClient,
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
                              value.noteDetail.subject,
                              style: AppFont.textTitleScreen,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        width: 250,
                        child: Text(
                          value.noteDetail.description,
                          style: AppFont.medium14,
                          maxLines: 5,
                        ),
                      ),
                      const SizedBox(height: 24.0),
                      ClientDate(
                          eventDate: value.noteDetail.eventDate,
                          reminder: value.noteDetail.reminder),
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
                                value.noteDetail.owner.first.username,
                                style: AppFont.textPersonOrTeam,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 24.0),
                      clientUpload()
                    ],
                  ),
                  Consumer<NoteViewModel>(
                    builder: (context, value, child) => SizedBox(
                      height: 48,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ElevatedButton(
                          onPressed: isActive
                              ? () async {
                                  try {
                                    await value
                                        .uploadFileClient(
                                            id: widget.noteDetail.id.toString(),
                                            selectedFile: _fileUrl)
                                        .then((value) => Fluttertoast.showToast(
                                            msg: 'Berhasil Upload File'))
                                        .then(
                                            (value) => Navigator.pop(context));
                                  } catch (e) {
                                    await Fluttertoast.showToast(
                                        msg: e.toString());
                                  }
                                }
                              : null,
                          style: ButtonStyle(
                            padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(
                                  horizontal: 100, vertical: 15),
                            ),
                            elevation: MaterialStatePropertyAll(0),
                            backgroundColor: MaterialStatePropertyAll(isActive
                                ? AppColor.activeColor
                                : AppColorNeutral.neutral2),
                          ),
                          child: Center(
                            child: Text(
                              'Simpan',
                              style: isActive
                                  ? AppFont.textFillButtonActive
                                  : AppFont.hintTextField,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
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

    void _pickMultipleFiles() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: true,
        allowedExtensions: ['jpg', 'png', 'pdf'],
      );

      if (result != null) {
        platformFileUrl = result.files;
        _fileUrl = result.paths.map((path) => File(path!)).toList();
        setState(() {});
      } else {
        // User canceled the picker
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
            if (platformFileUrl.isEmpty) {
              _pickMultipleFiles();
            } else {
              _pickFile();
            }
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
        // openFiles(platformFileUrl),
        widget.noteDetail.file.isNotEmpty || platformFileUrl.isNotEmpty
            ? Column(
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
              )
            : const SizedBox(),
      ],
    );
  }

  Widget openFiles(List<PlatformFile> files) {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Consumer<NoteViewModel>(
        builder: (context, value, child) {
          return Column(
            children: value.noteDetail.file.isNotEmpty
                ? value.noteDetail.file
                    .map((e) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FilePreviewScreen(url: e),
                            ));
                          },
                          child: Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            // padding: EdgeInsets.symmetric(horizontal: 10.0),
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColorNeutral.neutral2,
                                image: DecorationImage(
                                  image: NetworkImage(e),
                                  fit: BoxFit.cover,
                                )),
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.only(left: 10.0),
                              alignment: Alignment.centerLeft,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                                color: AppColorNeutral.neutral2,
                              ),
                              child: Text(
                                // e,
                                e.substring(e.lastIndexOf("/") + 1),
                                style: AppFont.regular12,
                              ),
                            ),
                          ),
                        ))
                    .toList()
                : platformFileUrl
                    .map((e) => GestureDetector(
                          onTap: () {
                            OpenFile.open(e.path);
                          },
                          child: Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            // padding: EdgeInsets.symmetric(horizontal: 10.0),
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: AppColorNeutral.neutral2,
                                image: DecorationImage(
                                  image: FileImage(File(e.path!)),
                                  fit: BoxFit.cover,
                                )),
                            child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width,
                              padding: const EdgeInsets.only(left: 10.0),
                              alignment: Alignment.centerLeft,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(8),
                                  bottomRight: Radius.circular(8),
                                ),
                                color: AppColorNeutral.neutral2,
                              ),
                              child: Text(
                                e.toString(),
                                style: AppFont.regular12,
                              ),
                            ),
                          ),
                        ))
                    .toList(),
          );
        },
      ),
    );
  }
}
