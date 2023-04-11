import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class ClientUpload extends StatefulWidget {
  const ClientUpload({Key? key}) : super(key: key);

  @override
  _ClientUploadState createState() => _ClientUploadState();
}

class _ClientUploadState extends State<ClientUpload> {
  PlatformFile? _pickedFile;

  void _openFile() {
    if (_pickedFile != null) {
      print('File opened: ${_pickedFile!.name}');
      if (_pickedFile!.extension == 'jpg' || _pickedFile!.extension == 'png') {
        // Display the image file
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text(_pickedFile!.name),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.download_rounded,
                    color: AppColorNeutral.neutral1,
                  ),
                  onPressed: _saveFile,
                ),
              ],
            ),
            body: Center(
              child: Image.file(File(_pickedFile!.path!)),
            ),
          ),
        ));
      } else if (_pickedFile!.extension == 'pdf') {
        // Display the PDF file
        Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(
              title: Text(_pickedFile!.name),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.download_rounded,
                    color: AppColorNeutral.neutral1,
                  ),
                  onPressed: _saveFile,
                ),
              ],
            ),
            body: PDFView(
              filePath: _pickedFile!.path!,
            ),
          ),
        ));
      } else {
        print('Unsupported file type');
      }
    }
  }

    void _saveFile() async {
    if (_pickedFile != null) {
      print('File saved: ${_pickedFile!.name}');
      if (_pickedFile!.extension == 'jpg' || _pickedFile!.extension == 'png') {
        // Save the image file
        final directory = await getApplicationDocumentsDirectory();
        final path = directory.path;
        final file = File(_pickedFile!.path!);
        final savedFile = await file.copy('$path/${_pickedFile!.name}');
        print('File saved to: ${savedFile.path}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Image saved to ${savedFile.path}'),
          ),
        );
      } else if (_pickedFile!.extension == 'pdf') {
        // Save the PDF file
        final directory = await getApplicationDocumentsDirectory();
        final path = directory.path;
        final file = File(_pickedFile!.path!);
        final savedFile = await file.copy('$path/${_pickedFile!.name}');
        print('File saved to: ${savedFile.path}');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('PDF saved to ${savedFile.path}'),
          ),
        );
      } else {
        print('Unsupported file type');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Unsupported file type'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Upload bukti",
          style: AppFont.semiBold14,
        ),
        const SizedBox(height: 8),
        Text(
          "File yang support adalah .jpg atau .png.",
          style: AppFont.medium14,
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () async {
            FilePickerResult? result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['jpg', 'pdf', 'doc'],
            );
            if (result != null) {
              setState(() {
                _pickedFile = result.files.first;
              });
            } else {
              print('Tidak mengambil File');
              // User canceled the picker
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
        const SizedBox(height: 16),
        if (_pickedFile != null)
          ElevatedButton(
            onPressed: _openFile,
            child: Text('Open file: ${_pickedFile!.name}'),
          ),
      ],
    );
  }
}
