import 'package:bantuin/models/invitation_model.dart';
import 'package:flutter/cupertino.dart';

import '../services/api/apps_repository.dart';
import '../utils/app_state.dart';

class InvitationViewModel with ChangeNotifier {
  final appsRepository = AppsRepository();

  List<InvitationDetailModel> _listOfInvitation = [];
  List<InvitationDetailModel> get listOfInvitation => _listOfInvitation;

  AppState _appState = AppState.loading;
  AppState get appState => _appState;

  void changeAppState(AppState appState) {
    _appState = appState;
    notifyListeners();
  }

  Future<void> fetchInvitation() async {
    try {
      changeAppState(AppState.loading);
      _listOfInvitation = await appsRepository.getAllInvitation();
      notifyListeners();
      changeAppState(AppState.loaded);
      if (_listOfInvitation.isEmpty) {
        changeAppState(AppState.noData);
      }
    } catch (e) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }

  Future<void> redirectLink(String url) async {
    String secUrl = url.replaceFirst('https://bantuin.fly.dev/api', '');
    try {
      changeAppState(AppState.loading);
      await appsRepository.getUrl(secUrl);
      notifyListeners();
      changeAppState(AppState.loaded);
      if (_listOfInvitation.isEmpty) {
        changeAppState(AppState.noData);
      }
    } catch (e) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }
}
