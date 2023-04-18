import 'package:bantuin/models/user_note_model.dart';
import 'package:flutter/material.dart';

class NoteViewModel with ChangeNotifier {
  // this code for get api
  List<UserNotesModel> _listNoteApi = [];
  List<UserNotesModel> get listNoteApi => _listNoteApi;
}
