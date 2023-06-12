import 'dart:io';

import 'package:bantuin/screens/note/all_file_client.dart';
import 'package:bantuin/screens/note/file_preview_local.dart';
import 'package:bantuin/screens/note/file_preview_screen.dart';
import 'package:bantuin/screens/note/notes_all_file.dart';
import 'package:bantuin/widgets/detail_note/client_camera.dart';
import 'package:bantuin/widgets/shimmer_loading/shimmer_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
// import 'package:path/path.dart';

import '../../constants/constant.dart';
import '../../utils/app_state.dart';
import '../../view_models/note_viewmodel.dart';
import '../../widgets/detail_note/client_date.dart';
import '../../widgets/detail_note/client_upload_status.dart';

class NoteDetailClient extends StatefulWidget {
  final int id;
  final String status;
  const NoteDetailClient({super.key, required this.id, required this.status});

  @override
  State<NoteDetailClient> createState() => _NoteDetailClientState();
}

class _NoteDetailClientState extends State<NoteDetailClient> {
  List<File> _fileUrl = [];
  List<PlatformFile> platformFileUrl = [];
  bool isUpload = false;
  bool isLate = false;
  bool isCompleted = false;
  bool isActive = false;

  List<File> images = [];
  File? image;

  @override
  void initState() {
    // TODO: implement initState
    Future.microtask(() => Provider.of<NoteViewModel>(context, listen: false)
        .getDetailNoteClient(widget.id));
    switch (widget.status) {
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
          Consumer<NoteViewModel>(builder: (context, note, child) {
            if (note.appState == AppState.loading) {
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
            if (note.appState == AppState.loaded) {
              return ClientUploadStatus(
                isUpload: isUpload,
                isCompleted: isCompleted,
                isLate: isLate,
              );
            }
            if (note.appState == AppState.noData) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('null'),
              );
            }
            if (note.appState == AppState.failure) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Text('null'),
              );
            }
            return const SizedBox();
          })
        ],
      ),
      body: SingleChildScrollView(
        child: Consumer<NoteViewModel>(
          builder: (context, note, child) {
            if (note.appState == AppState.loading) {
              return _loadingContainer();
            }
            if (note.appState == AppState.loaded) {
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
                                note.noteDetailClient.subject,
                                style: AppFont.textTitleScreen,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        SizedBox(
                          width: 250,
                          child: Text(
                            note.noteDetailClient.description,
                            style: AppFont.medium14,
                            maxLines: 5,
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        ClientDate(
                            eventDate: note.noteDetailClient.eventDate,
                            reminder: note.noteDetailClient.reminder),
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
                                  imageUrl: note.noteDetailClient.owner.photo,
                                  // imageUrl:
                                  //     'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                                  imageBuilder: (context, imageProvider) =>
                                      CircleAvatar(
                                    backgroundImage: imageProvider,
                                    radius: 12.0,
                                  ),
                                ),
                                SizedBox(width: 8.0),
                                Text(
                                  note.noteDetailClient.owner.username,
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
                  ],
                ),
              );
            }
            if (note.appState == AppState.noData) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  'Detail kosong',
                  style: AppFont.textScreenEmpty,
                ),
              );
            }
            if (note.appState == AppState.failure) {
              return Container(
                alignment: Alignment.center,
                child: Text(
                  'Gagal mengambil detail',
                  style: AppFont.textScreenEmpty,
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Consumer<NoteViewModel>(
        builder: (context, value, child) => Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          height: 48,
          child: ElevatedButton(
            onPressed: value.noteDetailClient.status == 'late'
                ? null
                : platformFileUrl.isNotEmpty ||
                        value.noteDetailClient.file.isNotEmpty
                    ? () async {
                        try {
                          await value
                              .uploadFileClient(
                                  id: value.noteDetailClient.id.toString(),
                                  selectedFile: _fileUrl)
                              .then((value) => Fluttertoast.showToast(
                                  msg: 'Berhasil Upload File'))
                              .then((value) => Navigator.pop(context));
                        } catch (e) {
                          await Fluttertoast.showToast(msg: e.toString());
                        }
                      }
                    : null,
            style: ButtonStyle(
              padding: MaterialStatePropertyAll(
                EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              ),
              elevation: MaterialStatePropertyAll(0),
              backgroundColor: MaterialStatePropertyAll(
                  value.noteDetailClient.status == 'late'
                      ? AppColorNeutral.neutral2
                      : platformFileUrl.isNotEmpty ||
                              value.noteDetailClient.file.isNotEmpty
                          ? AppColor.activeColor
                          : AppColorNeutral.neutral2),
            ),
            child: Center(
              child: Text(
                'Simpan',
                style: value.noteDetailClient.status == 'late'
                    ? AppFont.hintTextField
                    : platformFileUrl.isNotEmpty ||
                            value.noteDetailClient.file.isNotEmpty
                        ? AppFont.textFillButtonActive
                        : AppFont.hintTextField,
              ),
            ),
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

    void _pickMultipleFiles() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: true,
        allowedExtensions: ['jpg', 'png', 'pdf'],
      );

      if (result != null) {
        setState(() {
          platformFileUrl = result.files;
          _fileUrl = result.paths.map((path) => File(path!)).toList();
        });
      } else {
        // User canceled the picker
      }
    }

    // CAMERA FEATURE

    return Consumer<NoteViewModel>(
      builder: (context, value, child) {
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
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) => Container(
                    height: MediaQuery.of(context).size.height / 4.5,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        //CAMERA FAETURED
                        // ClientCamera(
                        //   onChanged: (value) async {
                        //     print('Uhuuuy $value');
                        //     setState(() {
                        //       image = value;
                        //       // images.add(value);
                        //     });
                        //   },
                        // ),
                        ElevatedButton(
                          onPressed: () async {
                            if (platformFileUrl.isEmpty) {
                              _pickMultipleFiles();
                            } else {
                              _pickFile();
                            }
                          },
                          style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(
                                AppColorNeutral.neutral2),
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(vertical: 10),
                            ),
                            elevation: MaterialStateProperty.all(0),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.phone_iphone_rounded,
                                color: Colors.black,
                              ),
                              SizedBox(width: 32),
                              Text(
                                "Pilih file di HP",
                                style: AppFont.textBottomSheet,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all(AppColorNeutral.neutral2),
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
            value.noteDetailClient.file.isNotEmpty || platformFileUrl.isNotEmpty
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
                            onPressed: () async {
                              if (value.noteDetailClient.file.isEmpty) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          AllFileClient(file: platformFileUrl),
                                    ));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NotesAllFile(
                                        file: value.noteDetailClient.file,
                                        isClient: true,
                                      ),
                                    ));
                              }
                              // Action to perform when the button is pressed
                            },
                            child: Text('Lihat Semua'),
                          ),
                        ],
                      ),
                      openFiles(),
                    ],
                  )
                : const SizedBox(),
          ],
        );
      },
    );
  }

  Widget openFiles() {
    return SizedBox(
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: Consumer<NoteViewModel>(
        builder: (context, value, child) {
          return Column(
            children: value.noteDetailClient.file.isNotEmpty
                ? value.noteDetailClient.file
                    .map((e) => GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FilePreviewScreen(
                                url: e,
                                isAdmin: false,
                              ),
                            ));
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            // padding: EdgeInsets.symmetric(horizontal: 10.0),
                            alignment: Alignment.bottomCenter,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColorNeutral.neutral2,
                            ),
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
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => FilePreviewLocal(url: e),
                            ));
                          },
                          child: Container(
                            height: 60,
                            width: MediaQuery.of(context).size.width,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColorNeutral.neutral2,
                            ),
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
                                // e.substring(e.lastIndexOf("/") + 1)
                                e.name,
                                // e.toString().substring(
                                //     e.toString().lastIndexOf("/") + 1),
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
