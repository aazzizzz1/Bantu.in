import 'dart:io';

import 'package:file_picker/file_picker.dart';

class FileNoteClientModel {
  final String id;
  final List<File> file;

  FileNoteClientModel({required this.id, required this.file});

  Map<String, dynamic> toJson() => {
        'note_id': id,
        'path[]': file,
      };
}
