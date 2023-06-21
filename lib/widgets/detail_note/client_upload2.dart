import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../constants/constant.dart';

class ClientUploadFile2 extends StatefulWidget {
  final void Function(
          List<File> selectedFiles, List<PlatformFile> selectedPlatformFiles)
      onChanged;
  const ClientUploadFile2({super.key, required this.onChanged});

  @override
  State<ClientUploadFile2> createState() => _ClientUploadFile2State();
}

class _ClientUploadFile2State extends State<ClientUploadFile2> {
  List<File> selectedFiles = [];
  List<PlatformFile> selectedPlatformFiles = [];

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
        selectedPlatformFiles.add(result.files.first);
        selectedFiles.add(_file);
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
      selectedPlatformFiles = result.files;
      selectedFiles = result.paths.map((path) => File(path!)).toList();
      setState(() {});
    } else {
      // User canceled the picker
    }
    print(selectedFiles);
  }

  void _removeFile(int index) {
    setState(() {
      selectedFiles.removeAt(index);
      selectedPlatformFiles.removeAt(index);
      widget.onChanged(
          selectedFiles, selectedPlatformFiles); // Call the onChanged callback
    });
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
        selectedFiles.isEmpty
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
                  openFiles(selectedPlatformFiles),
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
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final dataFile = files[index];
            return GestureDetector(
              onTap: () {
                OpenFile.open(dataFile.path);
              },
              child: Container(
                alignment: Alignment.bottomCenter,
                height: 50,
                width: 325,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: FileImage(
                        File(dataFile.path!),
                      ),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  alignment: Alignment.centerLeft,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    color: AppColorNeutral.neutral2,
                  ),
                  child: Text(
                    dataFile.name,
                    style: AppFont.regular12,
                  ),
                ),
              ),
            );
          }),
    );
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  Future<File> savePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }
}
