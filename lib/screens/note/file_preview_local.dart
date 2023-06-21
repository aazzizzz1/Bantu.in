import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class FilePreviewLocal extends StatefulWidget {
  final PlatformFile url;
  final bool? isAdmin;
  const FilePreviewLocal({super.key, required this.url, this.isAdmin});

  @override
  State<FilePreviewLocal> createState() => _FilePreviewLocalState();
}

class _FilePreviewLocalState extends State<FilePreviewLocal> {
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
      ),
      body: Container(
        alignment: Alignment.center,
        child: widget.url.extension == 'jpg' || widget.url.extension == 'png'
            ? Image.file(File(widget.url.path!))
            : widget.url.extension == 'pdf'
                ? SfPdfViewer.file(File(widget.url.path!))
                : const SizedBox(),
      ),
    );
  }
}
