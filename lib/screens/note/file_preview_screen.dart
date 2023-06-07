import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flowder/flowder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class FilePreviewScreen extends StatefulWidget {
  final String url;
  final bool? isAdmin;
  const FilePreviewScreen({super.key, required this.url, this.isAdmin});

  @override
  State<FilePreviewScreen> createState() => _FilePreviewScreenState();
}

class _FilePreviewScreenState extends State<FilePreviewScreen> {
  late DownloaderUtils options;
  late DownloaderCore core;
  late final String path;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initPlatformState();
  }

  void _setPath() async {
    Directory _path = await getApplicationDocumentsDirectory();

    String _localPath = _path.path + Platform.pathSeparator + 'Download';

    final savedDir = Directory(_localPath);
    bool hasExisted = await savedDir.exists();
    if (!hasExisted) {
      savedDir.create();
    }

    path = _localPath;
  }

  Future<void> initPlatformState() async {
    _setPath();
    if (!mounted) return;
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
          widget.isAdmin != null
              ? IconButton(
                  onPressed: () async {
                    options = DownloaderUtils(
                      progress: ProgressImplementation(),
                      file: File(
                          '$path/${widget.url.substring(widget.url.lastIndexOf("/") + 1)}'),
                      onDone: () {
                        // setState(() {
                        //   fileList[index].progress = 0.0;
                        // });
                        OpenFile.open(
                                '$path/${widget.url.substring(widget.url.lastIndexOf("/") + 1)}')
                            .then((value) {
                          // delete the file.
                          File f = File(
                              '$path/${widget.url.substring(widget.url.lastIndexOf("/") + 1)}');
                          f.delete();
                        });
                      },
                      // onDone: () =>
                      //     Fluttertoast.showToast(msg: 'Download berhasil'),
                      progressCallback: (current, total) {
                        final progress = (current / total) * 100;
                        print('Downloading: $progress');
                      },
                    );
                    // options = DownloaderUtils(
                    //   progressCallback: (current, total) {
                    //     final progress = (current / total) * 100;
                    //     print('Downloading: $progress');

                    //     setState(() {
                    //       fileList[index].progress = (current / total);
                    //     });
                    //   },
                    //   file: File('$path/${fileList[index].fileName}'),
                    //   progress: ProgressImplementation(),
                    // onDone: () {
                    //   setState(() {
                    //     fileList[index].progress = 0.0;
                    //   });
                    //   OpenFile.open('$path/${fileList[index].fileName}')
                    //       .then((value) {
                    //     // delete the file.
                    //     File f = File('$path/${fileList[index].fileName}');
                    //     f.delete();
                    //   });
                    // },
                    //   deleteOnCancel: true,
                    // );
                    core = await Flowder.download(
                      widget.url,
                      options,
                    );
                  },
                  // icon: Column(
                  //   children: [
                  //     if (fileList[index].progress == 0.0)
                  //       Icon(
                  //         Icons.download,

                  //       ),
                  //     if (fileList[index].progress != 0.0)
                  //       LinearPercentIndicator(
                  //         width: 100.0,
                  //         lineHeight: 14.0,
                  //         percent: fileList[index].progress!,
                  //         backgroundColor: Colors.blue,
                  //         progressColor: Colors.white,
                  //       ),
                  //   ],
                  // )
                  // fileList[index].progress != 0.0 ?
                  // ,
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
