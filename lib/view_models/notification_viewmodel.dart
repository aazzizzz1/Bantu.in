import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/models/notification.dart';
import 'package:bantuin/models/product_point_model.dart';
import 'package:bantuin/models/tim_model.dart';
import 'package:flutter/material.dart';

import '../services/api/apps_repository.dart';
import '../utils/app_state.dart';

class NotificationViewModel with ChangeNotifier {
  final AppsRepository appsRepository = AppsRepository();

  List<DetailNotificationModel> _listOfNotif = [];
  List<DetailNotificationModel> get listOfNotif => _listOfNotif;

  NoteDetailModel _noteDetailNotif = NoteDetailModel(
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
  NoteDetailModel get noteDetailNotif => _noteDetailNotif;

  TeamDetailModel _teamDetailNotif = TeamDetailModel(
    id: 0,
    title: 'null',
    owner: [],
    photo: '',
    participant: [],
  );
  TeamDetailModel get teamDetailNotif => _teamDetailNotif;

  AppState _appState = AppState.loading;
  AppState get appState => _appState;

  void changeAppState(AppState appState) {
    _appState = appState;
    notifyListeners();
  }

  Future<void> fetchNotif() async {
    try {
      changeAppState(AppState.loading);
      _listOfNotif = await appsRepository.getNotif();
      notifyListeners();
      changeAppState(AppState.loaded);

      if (_listOfNotif.isEmpty) {
        changeAppState(AppState.noData);
        notifyListeners();
      }
    } catch (e) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }

  Future<void> getDetailNoteNotif(int id) async {
    print('NOTE $id');
    try {
      changeAppState(AppState.loading);
      final response = await appsRepository.getDetailNote(id);
      _noteDetailNotif = NoteDetailModel.fromJson(response['data']);
      notifyListeners();
      changeAppState(AppState.loaded);
      if (_noteDetailNotif.id == 0) {
        changeAppState(AppState.noData);
      }
    } catch (_) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }

  Future<void> getDetailTeamNotif(int id) async {
    print('TIM $id');
    try {
      changeAppState(AppState.loading);
      final response = await appsRepository.getDetailTeam(id);
      _teamDetailNotif = TeamDetailModel.fromJson(response['data']);
      notifyListeners();
      changeAppState(AppState.loaded);
      if (_teamDetailNotif.id == 0) {
        changeAppState(AppState.noData);
      }
    } catch (_) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }
}
