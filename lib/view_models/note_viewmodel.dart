import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/models/post_note_model.dart';
import 'package:bantuin/models/user_note_model.dart';
import 'package:bantuin/services/api/api_services.dart';
import 'package:bantuin/services/api/apps_repository.dart';
import 'package:bantuin/services/api/personal_note_api.dart';
import 'package:bantuin/services/api/user_note_api.dart';
import 'package:flutter/material.dart';
import '../models/note_tim_model.dart';

class NoteViewModel with ChangeNotifier {
  final appsRepository = AppsRepository();
  final PersonalNoteApi _personalNote = PersonalNoteApi();

  List<NoteDetailModel> _listOfPersonalNote = [];
  List<NoteDetailModel> get listOfPersonalNote => _listOfPersonalNote;

  Future<void> postPersonalNote(PostNoteModel note) async {
    try {
      await appsRepository.postPersonalNote(note);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> getPersonalNote() async {
    try {
      _listOfPersonalNote = await appsRepository.getPersonalNote();
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> updatePersonalNote(
      PostNoteModel note, NoteDetailModel noteDetail) async {
    try {
      await appsRepository.updatePersonalNote(note, noteDetail.id);
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
