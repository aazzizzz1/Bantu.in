import 'package:bantuin/models/post_tim_model.dart';
import 'package:flutter/material.dart';

import '../models/tim_model.dart';
import '../services/api/apps_repository.dart';

class TeamViewModel with ChangeNotifier {
  final appsRepository = AppsRepository();

  List<TeamDetailModel> _listOfTeam = [];
  List<TeamDetailModel> get listOfTeam => _listOfTeam;

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
      _listOfTeam = await appsRepository.getAllTeam();
      notifyListeners();
    } catch (_) {
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
