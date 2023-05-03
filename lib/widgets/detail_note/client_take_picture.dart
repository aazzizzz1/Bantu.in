import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) {
        return;
      }
      // final imageTemp = File(image.path);
      final imagePermanent = await saveImagePermanent(image.path);
      setState(() {
        this.image = imagePermanent;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<File> saveImagePermanent(String imagePath) async {
    final directory = await getApplicationDocumentsDirectory();
    final name = basename(imagePath);
    final image = File('${directory.path}/$name');

    return File(imagePath).copy(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            image != null
                ? Image.file(
                    image!,
                    width: 160,
                    height: 160,
                  )
                : FlutterLogo(
                    size: 300,
                  ),
            ElevatedButton(
              onPressed: () {
                pickImage(ImageSource.gallery);
              },
              child: Text('Pick Galery'),
            ),
            ElevatedButton(
              onPressed: () {
                pickImage(ImageSource.camera);
              },
              child: Text('Take Picture'),
            ),
          ],
        ),
      ),
    );
  }
}
