import 'package:bantuin/models/column_model.dart';
import 'package:bantuin/services/api/apps_repository.dart';
import 'package:flutter/material.dart';

import '../utils/app_state.dart';

class ColumnViewModel with ChangeNotifier {
  final appsRepository = AppsRepository();
  List<ColumnModel> _listOfColumn = [];
  List<ColumnModel> get listOfColumn => _listOfColumn;

  AppState _appState = AppState.loading;
  AppState get appState => _appState;

  void changeAppState(AppState appState) {
    _appState = appState;
    notifyListeners();
  }

  void fetchColumn() async {
    try {
      changeAppState(AppState.loading);
      _listOfColumn = await appsRepository.fetchColumn();
      notifyListeners();
      changeAppState(AppState.loaded);
      if (_listOfColumn.isEmpty) {
        changeAppState(AppState.noData);
      }
    } catch (e) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }
}
