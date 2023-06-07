import 'package:bantuin/models/notification.dart';
import 'package:bantuin/models/product_point_model.dart';
import 'package:flutter/material.dart';

import '../services/api/apps_repository.dart';
import '../utils/app_state.dart';

class NotificationViewModel with ChangeNotifier {
  final AppsRepository appsRepository = AppsRepository();

  List<DetailNotificationModel> _listOfNotif = [];
  List<DetailNotificationModel> get listOfNotif => _listOfNotif;

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
}
