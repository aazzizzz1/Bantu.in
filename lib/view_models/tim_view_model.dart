import 'package:bantuin/models/post_tim_model.dart';
import 'package:flutter/material.dart';

import '../models/tim_model.dart';
import '../services/api/apps_repository.dart';
import '../utils/app_state.dart';

class TeamViewModel with ChangeNotifier {
  final appsRepository = AppsRepository();

  List<TeamDetailModel> _listOfTeam = [];
  List<TeamDetailModel> get listOfTeam => _listOfTeam;

  TeamDetailModel _detailTeam = TeamDetailModel(
    id: 0,
    title: 'null',
    owner: [],
    photo: 'null',
    participant: [],
  );
  TeamDetailModel get detailTeam => _detailTeam;

  AppState _appState = AppState.loading;
  AppState get appState => _appState;

  void changeAppState(AppState appState) {
    _appState = appState;
    notifyListeners();
  }

  Future<void> addTeam(PostTimModel tim) async {
    try {
      await appsRepository.postAddTeam(tim);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> fetchAllTeam() async {
    try {
      changeAppState(AppState.loading);
      _listOfTeam = await appsRepository.getAllTeam();
      notifyListeners();
      changeAppState(AppState.loaded);
      if (_listOfTeam.isEmpty) {
        changeAppState(AppState.noData);
        notifyListeners();
      }
    } catch (_) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }

  Future<void> getDetailTeam(TeamDetailModel team) async {
    try {
      changeAppState(AppState.loading);
      _detailTeam = await appsRepository.getDetailTeam(team.id);
      notifyListeners();
      changeAppState(AppState.loaded);
      if (_detailTeam.id == 0) {
        changeAppState(AppState.noData);
        notifyListeners();
      }
    } catch (_) {
      changeAppState(AppState.failure);
      rethrow;
    }
  }

  Future<void> editTeam(TeamDetailModel teamDetail, PostTimModel tim) async {
    try {
      await appsRepository.updateTeam(teamDetail.id, tim);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> kickMemberTeam(TeamDetailModel tim, String email) async {
    try {
      await appsRepository.postKickMember(email, tim.id);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }
}
