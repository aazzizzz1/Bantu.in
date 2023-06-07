import 'package:bantuin/models/note_history_model.dart';
import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/services/api/apps_repository.dart';
import 'package:flutter/foundation.dart';

import '../utils/app_state.dart';

class HistoryViewModel with ChangeNotifier {
  AppsRepository appsRepository = AppsRepository();

  AppState _appState = AppState.loading;
  AppState get appState => _appState;

  List<HistoryDetailModel> _listOfHistory = [];
  List<HistoryDetailModel> get listOfHistory => _listOfHistory;

  OwnerDetailModel _ownerNote = OwnerDetailModel(
    id: 0,
    username: 'null',
    email: 'null',
    phone: 'null',
    job: 'null',
    photo: 'null',
  );
  OwnerDetailModel get ownerNote => _ownerNote;

  NoteHistoryModel _noteHistory = NoteHistoryModel(
    owner: OwnerDetailModel(
      id: 0,
      username: 'null',
      email: 'null',
      phone: 'null',
      job: 'null',
      photo: 'null',
    ),
    history: [],
    noteCreated: DateTime.now(),
    noteDone: DateTime.now(),
    noteStatus: 'null',
  );
  NoteHistoryModel get noteHistory => _noteHistory;

  void changeAppState(AppState appState) {
    _appState = appState;
    notifyListeners();
  }

  void fetchHistory(NoteDetailModel noteDetail) async {
    try {
      changeAppState(AppState.loading);
      _listOfHistory = await appsRepository.getHistory(noteDetail.id);
      _noteHistory = await appsRepository.getHistoryNote(noteDetail.id);
      notifyListeners();
      changeAppState(AppState.loaded);
      if (_listOfHistory.isEmpty) {
        changeAppState(AppState.noData);
      }
    } catch (_) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }
}
