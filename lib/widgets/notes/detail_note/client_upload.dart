import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/cupertino.dart';

import '../../../constants/color/app_color.dart';
import '../../../constants/font/app_font.dart';

class ClientUpload extends StatelessWidget {
  const ClientUpload({super.key});

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
          " File yang support adalah .jpg atau .png.",
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
              PlatformFile file = result.files.first;
              Text(file.name);
              print(file.name);
              print(file.bytes);
              print(file.size);
              print(file.extension);
              print(file.path);
            } else {
              print('Tidak mengambil File');
              // User canceled the picker
            }
          },
          style: const ButtonStyle(
            overlayColor: MaterialStatePropertyAll(AppColorNeutral.neutral2),
            padding: MaterialStatePropertyAll(
              EdgeInsets.symmetric(vertical: 10),
            ),
            elevation: MaterialStatePropertyAll(0),
            side: MaterialStatePropertyAll(
                BorderSide(color: AppColorNeutral.neutral2)),
            backgroundColor: MaterialStatePropertyAll(Colors.white),
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
      ],
    );
  }
}
