import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:bantuin/constants/color/app_color.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ClientUpload extends StatefulWidget {
  const ClientUpload({Key? key}) : super(key: key);

  @override
  _ClientUploadState createState() => _ClientUploadState();
}

class _ClientUploadState extends State<ClientUpload> {
  PlatformFile? _pickedFile;
  late File file = File(_pickedFile!.name);
  // File? camera;

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
            body: SfPdfViewer.file(File(_pickedFile!.path!)),
          ),
        ));
      } else {
        print('Unsupported file type');
      }
    }
  }

  void _saveFile() async {
    if (_pickedFile != null) {
      final directory = await getApplicationDocumentsDirectory();
      final path = directory.path;
      final file = File(_pickedFile!.path!);
      final savedFile = await file.copy('$path/${_pickedFile!.name}');
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        SnackBar(
          content: Text('File saved to ${savedFile.path}'),
        ),
      );
    }
  }

  void _pickMultipleFiles() async {
    String _fileText = "";
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      setState(() {
        _fileText = files.toString();
      });
    } else {
      // User canceled the picker
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // ElevatedButton(
                    //   onPressed: () async {
                    //     await pickImage(ImageSource.camera);
                    //   },
                    //   style: ButtonStyle(
                    //     overlayColor:
                    //         MaterialStateProperty.all(AppColorNeutral.neutral2),
                    //     padding: MaterialStateProperty.all(
                    //       const EdgeInsets.symmetric(vertical: 10),
                    //     ),
                    //     elevation: MaterialStateProperty.all(0),
                    //     backgroundColor:
                    //         MaterialStateProperty.all(Colors.white),
                    //   ),
                    //   child: Row(
                    //     children: [
                    //       const Icon(
                    //         Icons.camera_alt_outlined,
                    //         color: Colors.black,
                    //       ),
                    //       const SizedBox(width: 32),
                    //       Text(
                    //         "Gunakan kamera",
                    //         style: AppFont.textBottomSheet,
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    ElevatedButton(
                      onPressed: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'png', 'pdf'],
                        );
                        if (result != null) {
                          setState(() {
                            _pickedFile = result.files.first;
                          });
                        } else {
                          print('Tidak mengambil File');
                          // User canceled the picker
                        }
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(AppColorNeutral.neutral2),
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
            // showBottomSheet(
            //   context: context,
            //   builder: (context) => BottomSheet(
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(4)),
            //     // constraints: BoxConstraints(maxHeight: 30),
            //     onClosing: () {},
            //     builder: (context) => Container(
            //       height: 150,
            //       child: Column(
            // children: [
            //   ElevatedButton(
            //     onPressed: () async {},
            //     style: ButtonStyle(
            //       overlayColor: MaterialStateProperty.all(
            //           AppColorNeutral.neutral2),
            //       padding: MaterialStateProperty.all(
            //         const EdgeInsets.symmetric(vertical: 10),
            //       ),
            //       elevation: MaterialStateProperty.all(0),
            //       side: MaterialStateProperty.all(
            //         const BorderSide(color: AppColorNeutral.neutral2),
            //       ),
            //       backgroundColor:
            //           MaterialStateProperty.all(Colors.white),
            //     ),
            //     child: Row(
            //       children: [
            //         Icon(Icons.camera_alt_outlined),
            //         SizedBox(width: 32),
            //         Text(
            //           "Gunakan kamera",
            //           style: AppFont.semiBold14,
            //         ),
            //       ],
            //     ),
            //   ),
            //   ElevatedButton(
            //     onPressed: () async {
            //       FilePickerResult? result =
            //           await FilePicker.platform.pickFiles(
            //         type: FileType.custom,
            //         allowedExtensions: ['jpg', 'png', 'pdf'],
            //       );
            //       if (result != null) {
            //         setState(() {
            //           _pickedFile = result.files.first;
            //         });
            //       } else {
            //         print('Tidak mengambil File');
            //         // User canceled the picker
            //       }
            //     },
            //     style: ButtonStyle(
            //       overlayColor: MaterialStateProperty.all(
            //           AppColorNeutral.neutral2),
            //       padding: MaterialStateProperty.all(
            //         const EdgeInsets.symmetric(vertical: 10),
            //       ),
            //       elevation: MaterialStateProperty.all(0),
            //       side: MaterialStateProperty.all(
            //         const BorderSide(color: AppColorNeutral.neutral2),
            //       ),
            //       backgroundColor:
            //           MaterialStateProperty.all(Colors.white),
            //     ),
            //     child: Row(
            //       children: [
            //         Icon(Icons.camera_alt_outlined),
            //         SizedBox(width: 32),
            //         Text("Pilih file di HP"),
            //       ],
            //     ),
            //   ),
            // ],
            //       ),
            //     ),
            //   ),
            // );
            // FilePickerResult? result = await FilePicker.platform.pickFiles(
            //   type: FileType.custom,
            //   allowedExtensions: ['jpg', 'png', 'pdf'],
            // );
            // if (result != null) {
            //   setState(() {
            //     _pickedFile = result.files.first;
            //   });
            // } else {
            //   print('Tidak mengambil File');
            //   // User canceled the picker
            // }
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
        _pickedFile != null
            ? Column(
                children: [
                  Row(
                    //spaceBetween
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
                      )
                    ],
                  ),
                  ElevatedButton(
                    onPressed: _openFile,
                    child: Text('Open file: ${_pickedFile!.name}'),
                  ),
                ],
              )
            : const SizedBox()
        // if (_pickedFile != null)
        //   Column(
        //     children: [
        //       Row(
        //         //spaceBetween
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(
        //             "File yang telah diunggah",
        //             style: AppFont.semiBold14,
        //           ),
        //           TextButton(
        //             onPressed: () {
        //               // Action to perform when the button is pressed
        //             },
        //             child: Text('Lihat Semua'),
        //           )
        //         ],
        //       ),
        // ElevatedButton(
        //   onPressed: _openFile,
        //   child: Text('Open file: ${_pickedFile!.name}'),
        // ),
        //     ],
        //   ),
      ],
    );
  }
}
