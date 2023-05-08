import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/models/user_note_model.dart';
import 'package:bantuin/services/api/personal_note_api.dart';
import 'package:bantuin/services/api/user_note_api.dart';
import 'package:flutter/material.dart';

import '../models/note_tim_model.dart';

class NoteViewModel with ChangeNotifier {
  final PersonalNoteApi _personalNote = PersonalNoteApi();

  List<NoteModel> _listOfPersonalNote = [];
  List<NoteModel> get listOfPersonalNote => _listOfPersonalNote;

  Future<void> postPersonalNote(NoteModel note) async {
    try {
      await _personalNote.postApi(note);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> fetchPersonalNote(String type) async {
    try {
      _listOfPersonalNote = await _personalNote.getApi(type);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }
}

List<NoteTimModel> listNoteTim = [
  NoteTimModel(
    title: "Admin",
    items: [
      NoteTimModelItems(
        titles: 'Meeting with client',
        description: 'Discuss bantuin project requirements with client',
        date: '16',
        month: 'Nov',
        avatarUrl:
            'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
        name: 'Zizi',
        isUploaded: false,
      ),
      NoteTimModelItems(
        titles: 'Meeting with client',
        description: 'Discuss bantuin project requirements with client',
        date: '16',
        month: 'Nov',
        avatarUrl:
            'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
        name: 'Zizi',
        isUploaded: false,
      ),
      NoteTimModelItems(
        titles: 'Meeting with client',
        description: 'Discuss bantuin project requirements with client',
        date: '16',
        month: 'Nov',
        avatarUrl:
            'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
        name: 'Zizi',
        isUploaded: false,
      ),
    ],
  ),
  NoteTimModel(
    title: "Supervisor",
    items: [
      NoteTimModelItems(
        titles: 'Meeting with client',
        description: 'Discuss bantuin project requirements with client',
        date: '16',
        month: 'Nov',
        avatarUrl:
            'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
        name: 'Zizi',
        isUploaded: false,
      ),
      NoteTimModelItems(
        titles: 'Meeting with client',
        description: 'Discuss bantuin project requirements with client',
        date: '16',
        month: 'Nov',
        avatarUrl:
            'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
        name: 'Zizi',
        isUploaded: false,
      ),
      NoteTimModelItems(
        titles: 'Meeting with client',
        description: 'Discuss bantuin project requirements with client',
        date: '16',
        month: 'Nov',
        avatarUrl:
            'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
        name: 'Zizi',
        isUploaded: false,
      ),
    ],
  ),
];
