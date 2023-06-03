import 'dart:io';

import 'package:bantuin/models/note_detail_client_model.dart';
import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/models/post_note_model.dart';
import 'package:bantuin/models/user_note_model.dart';
import 'package:bantuin/services/api/api_services.dart';
import 'package:bantuin/services/api/apps_repository.dart';
import 'package:flutter/material.dart';
import '../models/file_note_client.dart';
import '../models/note_team_model.dart';
import 'package:bantuin/utils/app_state.dart';

class NoteViewModel with ChangeNotifier {
  final appsRepository = AppsRepository();

  List<NoteDetailModel> _listOfPersonalNote = [];
  List<NoteDetailModel> get listOfPersonalNote => _listOfPersonalNote;

  List<NoteDetailModel> _listOfCompleteNote = [];
  List<NoteDetailModel> get listOfCompleteNote => _listOfCompleteNote;

  List<NoteDetailModel> _listOfPassedNote = [];
  List<NoteDetailModel> get listOfPassedNote => _listOfPassedNote;

  List<NoteDetailModel> _listOfUpcomingNote = [];
  List<NoteDetailModel> get listOfUpcomingNote => _listOfUpcomingNote;

  List<NoteDetailModel> _listOfTeamNote = [];
  List<NoteDetailModel> get listOfTeamNote => _listOfTeamNote;

  AppState _appState = AppState.loading;
  AppState get appState => _appState;

  late NoteDetailClientModel _notedetail = NoteDetailClientModel(
    id: 0,
    subject: 'null',
    description: 'null',
    eventDate: DateTime.now(),
    reminder: DateTime.now(),
    notesType: 'personal',
    status: [],
    owner: [],
    ringtone: 'null',
    file: [],
    member: [],
  );
  NoteDetailClientModel get noteDetail => _notedetail;

  void changeAppState(AppState appState) {
    _appState = appState;
    notifyListeners();
  }

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
      changeAppState(AppState.loading);
      _listOfPersonalNote = await appsRepository.getPersonalNote();
      notifyListeners();
      changeAppState(AppState.loaded);
      if (_listOfPersonalNote.isEmpty) {
        changeAppState(AppState.noData);
      }
    } catch (_) {
      changeAppState(AppState.failure);
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

  Future<void> deletePersonalNote(NoteDetailModel noteDetail) async {
    try {
      await appsRepository.deletePersonalNote(noteDetail.id);
      getPersonalNote();
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> getDetailNote(int id) async {
    try {
      changeAppState(AppState.loading);
      _notedetail = await appsRepository.getDetailNote(id);
      notifyListeners();
      changeAppState(AppState.loaded);
      if (_listOfPersonalNote.isEmpty) {
        changeAppState(AppState.noData);
      }
    } catch (_) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }

  Future<void> uploadFileClient(
      {required String id, required List<File> selectedFile}) async {
    try {
      await appsRepository.postFileClient(id: id, selectedFile: selectedFile);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> filterPassedNote() async {
    try {
      changeAppState(AppState.loading);
      _listOfPassedNote = await appsRepository.filterNote('?passed=yes');
      notifyListeners();
      changeAppState(AppState.loaded);
      if (_listOfPassedNote.isEmpty) {
        changeAppState(AppState.noData);
      }
    } catch (e) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }

  Future<void> filterUpcomingNote() async {
    try {
      changeAppState(AppState.loading);
      _listOfUpcomingNote = await appsRepository.filterNote('?upcoming=yes');
      notifyListeners();
      changeAppState(AppState.loaded);
      if (_listOfUpcomingNote.isEmpty) {
        changeAppState(AppState.noData);
      }
    } catch (e) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }

  Future<void> filterCompleteNote() async {
    try {
      changeAppState(AppState.loading);
      _listOfPassedNote = await appsRepository.filterNote('?completed=yes');
      notifyListeners();
      changeAppState(AppState.loaded);
      if (_listOfPassedNote.isEmpty) {
        changeAppState(AppState.noData);
      }
    } catch (e) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }

  Future<void> filterLateNote() async {
    try {
      changeAppState(AppState.loading);
      _listOfPassedNote = await appsRepository.filterNote('?late=yes');
      changeAppState(AppState.loaded);
      if (_listOfPassedNote.isEmpty) {
        changeAppState(AppState.noData);
      }
      notifyListeners();
    } catch (e) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }

  Future<void> filterIsUploadNote(String status) async {
    try {
      changeAppState(AppState.loading);
      _listOfUpcomingNote = await appsRepository.filterNote('?$status=yes');
      notifyListeners();
      changeAppState(AppState.loaded);
      if (_listOfUpcomingNote.isEmpty) {
        changeAppState(AppState.noData);
      }
    } catch (e) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }

  Future<void> filterIsOwnerUpcoming() async {
    try {
      changeAppState(AppState.loading);
      _listOfUpcomingNote =
          await appsRepository.filterNote('?note=upcoming&owner=yes');
      notifyListeners();
      changeAppState(AppState.loaded);
      if (_listOfUpcomingNote.isEmpty) {
        changeAppState(AppState.noData);
      }
    } catch (e) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }

  Future<void> filterIsOwnerPassed() async {
    try {
      changeAppState(AppState.loading);
      _listOfPassedNote =
          await appsRepository.filterNote('?note=passed&owner=yes');
      notifyListeners();
      changeAppState(AppState.loaded);
      if (_listOfPassedNote.isEmpty) {
        changeAppState(AppState.noData);
      }
    } catch (e) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }

  Future<void> filterDescUpcoming() async {
    _listOfUpcomingNote.sort((a, b) => (b.eventDate).compareTo(a.eventDate));
    notifyListeners();
  }

  Future<void> filterAscUpcoming() async {
    _listOfUpcomingNote.sort((a, b) => (a.eventDate).compareTo(b.eventDate));
    notifyListeners();
  }

  Future<void> filterDescPassed() async {
    _listOfPassedNote.sort((a, b) => (b.eventDate).compareTo(a.eventDate));
    notifyListeners();
  }

  Future<void> filterAscPassed() async {
    _listOfPassedNote.sort((a, b) => (a.eventDate).compareTo(b.eventDate));
    notifyListeners();
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
