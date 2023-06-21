import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

import '../../constants/constant.dart';

class ClientCamera extends StatefulWidget {
  final ValueChanged onChanged;
  const ClientCamera({super.key, required this.onChanged});

  @override
  State<ClientCamera> createState() => _ClientCameraState();
}

class _ClientCameraState extends State<ClientCamera> {
  File? image;
  Future<File> saveImagePermanent(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$imagePath');

    return File(imagePath).copy(image.path);
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      }
      final imageTemp = File(image.path);
      // final imagePermanent = await saveImagePermanent(image.path);
      this.image = imageTemp;
      widget.onChanged(imageTemp);
      // setState(() {});
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await pickImage(ImageSource.camera);
      },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(AppColorNeutral.neutral2),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 10),
        ),
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.camera_alt_outlined,
            color: Colors.black,
          ),
          const SizedBox(width: 32),
          Text(
            "Gunakan kamera",
            style: AppFont.textBottomSheet,
          ),
        ],
      ),
    );
  }
}
