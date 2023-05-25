import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class FilePreviewScreen extends StatefulWidget {
  final String url;
  final bool? isAdmin;
  const FilePreviewScreen({super.key, required this.url, this.isAdmin});

  @override
  State<FilePreviewScreen> createState() => _FilePreviewScreenState();
}

class _FilePreviewScreenState extends State<FilePreviewScreen> {
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
                  onPressed: () {},
                  icon: Icon(Icons.download_sharp),
                  color: Colors.black,
                )
              : const SizedBox()
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Image.network(widget.url),
      ),
    );
  }
}
