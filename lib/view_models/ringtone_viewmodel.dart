import 'package:bantuin/models/ringtone_model.dart';
import 'package:bantuin/services/api/apps_repository.dart';
import 'package:flutter/material.dart';

import '../utils/app_state.dart';

class RingtoneViewModel with ChangeNotifier {
  final appsRepository = AppsRepository();
  List<RingtoneDetailModel> _listOfRingtone = [];
  List<RingtoneDetailModel> get listOfRingtone => _listOfRingtone;

  AppState _appState = AppState.loading;
  AppState get appState => _appState;

  void changeAppState(AppState appState) {
    _appState = appState;
    notifyListeners();
  }

  void fetchRingtone() async {
    try {
      changeAppState(AppState.loading);
      _listOfRingtone = await appsRepository.fetchRingtone();
      notifyListeners();
      changeAppState(AppState.loaded);
      if (_listOfRingtone.isEmpty) {
        changeAppState(AppState.noData);
      }
    } catch (e) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }
}
