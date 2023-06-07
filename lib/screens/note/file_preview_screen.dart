import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class FilePreviewScreen extends StatefulWidget {
  final String url;
  final bool? isAdmin;
  const FilePreviewScreen({super.key, required this.url, this.isAdmin});

  @override
  State<FilePreviewScreen> createState() => _FilePreviewScreenState();
}

class _FilePreviewScreenState extends State<FilePreviewScreen> {
  // late DownloaderUtils options;
  // late DownloaderCore core;
  late final String path;
  ReceivePort _port = ReceivePort();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // NEW DOWNLOADER
    IsolateNameServer.registerPortWithName(
        _port.sendPort, 'downloader_send_port');
    _port.listen((dynamic data) {
      String id = data[0];
      DownloadTaskStatus status = DownloadTaskStatus(data[1]);
      int progress = data[2];
      if (status == DownloadTaskStatus.complete) {
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            elevation: 0,
            backgroundColor: Colors.transparent,
            forceActionsBelow: true,
            content: AwesomeSnackbarContent(
              title: 'Selesai!!',
              message:
                  'Berhasil download ${widget.url.substring(data.lastIndexOf("/") + 1)}',
              contentType: ContentType.success,
              inMaterialBanner: true,
            ),
            actions: const [SizedBox.shrink()],
          ),
        );
      }

      if (status == DownloadTaskStatus.failed) {
        ScaffoldMessenger.of(context).showMaterialBanner(
          MaterialBanner(
            elevation: 0,
            backgroundColor: Colors.transparent,
            forceActionsBelow: true,
            content: AwesomeSnackbarContent(
              title: 'Gagal!!',
              message: 'Gagal unduh file',
              contentType: ContentType.failure,
              inMaterialBanner: true,
            ),
            actions: const [SizedBox.shrink()],
          ),
        );
      }
      setState(() {});
    });

    FlutterDownloader.registerCallback(downloadCallback);
  }

  @override
  void dispose() {
    IsolateNameServer.removePortNameMapping('downloader_send_port');
    super.dispose();
  }

  @pragma('vm:entry-point')
  static void downloadCallback(String id, int status, int progress) {
    final SendPort? send =
        IsolateNameServer.lookupPortByName('downloader_send_port');
    send!.send([id, status, progress]);
  }

  Future download(String url) async {
    var status = await Permission.storage.request();
    final baseStorage = await getExternalStorageDirectories();
    if (status.isGranted) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
      await FlutterDownloader.enqueue(
        url: url,
        headers: {}, // optional: header send with url (auth token etc)
        savedDir: baseStorage!.first.path,
        showNotification:
            true, // show download progress in status bar (for Android)
        openFileFromNotification:
            true, // click on notification to open downloaded file (for Android)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          widget.isAdmin != false
              ? IconButton(
                  onPressed: () async {
                    download(widget.url);
                  },
                  icon: Icon(Icons.download_sharp),
                  color: Colors.black,
                )
              : const SizedBox()
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: CachedNetworkImage(
          imageUrl: widget.url,
          placeholder: (context, url) => const CircularProgressIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          // imageBuilder: (context, imageProvider) =>
          // CircleAvatar(
          //   backgroundImage: imageProvider,
          //   radius: 50.0,
          // ),
        ),
      ),
    );
  }
}
