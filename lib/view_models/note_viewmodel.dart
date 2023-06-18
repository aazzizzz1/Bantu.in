import 'dart:io';

import 'package:alarm/alarm.dart';
import 'package:bantuin/models/note_detail_client_model.dart';
import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/models/post_note_model.dart';
import 'package:bantuin/models/user_note_model.dart';
import 'package:bantuin/services/api/api_services.dart';
import 'package:bantuin/services/api/apps_repository.dart';
import 'package:bantuin/view_models/ringtone_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import '../models/file_note_client.dart';
import '../models/note_team_model.dart';
import 'package:bantuin/utils/app_state.dart';

class NoteViewModel with ChangeNotifier {
  final appsRepository = AppsRepository();
  final ringtones = RingtoneViewModel();

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

  late NoteDetailClientModel _noteDetailClient = NoteDetailClientModel(
    id: 0,
    subject: 'null',
    description: 'null',
    eventDate: DateTime.now(),
    reminder: DateTime.now(),
    notesType: 'personal',
    status: 'null',
    owner: OwnerDetailModel(
      id: 0,
      username: 'null',
      email: 'null',
      phone: 'null',
      job: 'null',
      photo:
          'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
    ),
    ringtone: 'null',
    file: [],
    member: [],
  );
  NoteDetailClientModel get noteDetailClient => _noteDetailClient;

  late NoteDetailModel _noteDetailAdmin = NoteDetailModel(
    id: 0,
    subject: 'null',
    description: 'null',
    eventDate: DateTime.now(),
    reminder: DateTime.now(),
    notesType: 'personal',
    status: 'null',
    owner: OwnerDetailModel(
      id: 0,
      username: 'null',
      email: 'null',
      phone: 'null',
      job: 'null',
      photo:
          'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
    ),
    ringtone: 'null',
    file: [],
    member: [],
  );
  NoteDetailModel get noteDetailAdmin => _noteDetailAdmin;

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

  Future<void> removeMember(NoteDetailModel noteDetail, String email) async {
    try {
      await appsRepository.postRemoveMember(noteDetail.id, email);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> updateCollaborationNote(
      PostNoteModel note, String msg, NoteDetailModel noteDetail) async {
    try {
      await appsRepository.updateCollborationNote({
        "subject": note.subject,
        "description": note.description,
        "event_date": note.eventDate,
        "email": note.email,
        "reminder": note.reminder,
        "ringtone_id": note.ringtoneId,
        "body": msg
      }, noteDetail.id);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> completeNote(NoteDetailModel noteDetail) async {
    try {
      await appsRepository.putCompletedNote(noteDetail.id);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> deletePersonalNote(
      NoteDetailModel noteDetail, String msg) async {
    try {
      await appsRepository.deletePersonalNote(noteDetail.id, msg);
      getPersonalNote();
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> getDetailNoteClient(int id) async {
    try {
      changeAppState(AppState.loading);
      final response = await appsRepository.getDetailNote(id);
      _noteDetailClient = NoteDetailClientModel.fromJson(response);
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

  Future<void> getDetailNoteAdmin(int id) async {
    try {
      changeAppState(AppState.loading);
      final response = await appsRepository.getDetailNote(id);
      _noteDetailAdmin = NoteDetailModel.fromJson(response['data']);
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

  //FILTER BEGIN

  Future<void> filterPassedNote() async {
    try {
      changeAppState(AppState.loading);
      _listOfPassedNote =
          await appsRepository.filterNote('?passed=yes&sort=desc');
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
      setReminder();
      setEventDate();
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
          await appsRepository.filterNote('?upcoming=yes&owner=yes');
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
          await appsRepository.filterNote('?passed=yes&owner=yes');
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

  Future<void> setReminder() async {
    String audioAlarm = 'lib/assets/ringtones/telolet.mp3';

    for (int i = 0; i < listOfUpcomingNote.length; i++) {
      switch (listOfUpcomingNote[i].ringtone) {
        case 'Bulletin':
          audioAlarm = 'lib/assets/ringtones/Bulletin.mp3';
          break;
        case 'Destiny':
          audioAlarm = 'lib/assets/ringtones/Destiny.mp3';
          break;
        case 'Radar':
          audioAlarm = 'lib/assets/ringtones/Radar.mp3';
          break;
        case 'Strangers':
          audioAlarm = 'lib/assets/ringtones/Strangers.mp3';
          break;
        case 'Waves':
          audioAlarm = 'lib/assets/ringtones/Waves.mp3';
          break;
        default:
          audioAlarm = 'lib/assets/ringtones/telolet.mp3';
      }
      if (listOfUpcomingNote[i].reminder.isAfter(DateTime.now())) {
        final alarmSetting = AlarmSettings(
          id: listOfUpcomingNote[i].id,
          dateTime: listOfUpcomingNote[i].reminder,
          assetAudioPath: audioAlarm,
          // assetAudioPath: ringtones.listOfRingtone.,
          notificationTitle: listOfUpcomingNote[i].subject,
          notificationBody: listOfUpcomingNote[i].description,
        );
        await Alarm.set(alarmSettings: alarmSetting);
        // print(
        //     'berhasil menambahkan ${_listOfUpcomingNote[i].subject} ${DateFormat.yMd().add_jm().format(listOfUpcomingNote[i].reminder)}');
      }

      // print('gagal $i');
    }
  }

  Future<void> setEventDate() async {
    String audioAlarm = 'lib/assets/ringtones/telolet.mp3';

    for (int i = 0; i < listOfUpcomingNote.length; i++) {
      switch (listOfUpcomingNote[i].ringtone) {
        case 'Bulletin':
          audioAlarm = 'lib/assets/ringtones/Bulletin.mp3';
          break;
        case 'Destiny':
          audioAlarm = 'lib/assets/ringtones/Destiny.mp3';
          break;
        case 'Radar':
          audioAlarm = 'lib/assets/ringtones/Radar.mp3';
          break;
        case 'Strangers':
          audioAlarm = 'lib/assets/ringtones/Strangers.mp3';
          break;
        case 'Waves':
          audioAlarm = 'lib/assets/ringtones/Waves.mp3';
          break;
        default:
          audioAlarm = 'lib/assets/ringtones/telolet.mp3';
      }
      if (listOfUpcomingNote[i].eventDate.isAfter(DateTime.now())) {
        final alarmSetting = AlarmSettings(
          id: listOfUpcomingNote[i].id,
          dateTime: listOfUpcomingNote[i].eventDate,
          assetAudioPath: audioAlarm,
          // assetAudioPath: ringtones.listOfRingtone.,
          notificationTitle: listOfUpcomingNote[i].subject,
          notificationBody: listOfUpcomingNote[i].description,
        );
        await Alarm.set(alarmSettings: alarmSetting);
        // print(audioAlarm);
        // print(
        //     'berhasil menambahkan acara ${_listOfUpcomingNote[i].subject} ${DateFormat.yMd().add_jm().format(listOfUpcomingNote[i].eventDate)}');
      }
      // print('gagal $i');
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

  Future<void> earnedPoint(NoteDetailModel note) async {
    try {
      await appsRepository.earnedPoint(note.id);
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
