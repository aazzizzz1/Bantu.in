import 'package:bantuin/models/post_tim_model.dart';
import 'package:flutter/material.dart';

import '../models/tim_model.dart';
import '../services/api/apps_repository.dart';

class TeamViewModel with ChangeNotifier {
  final appsRepository = AppsRepository();

  List<TeamDetailModel> _listOfTeam = [];
  List<TeamDetailModel> get listOfTeam => _listOfTeam;

  Future<void> addTim(PostTimModel tim) async {
    try {
      await appsRepository.postAddTim(tim);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> fetchAllTeam() async {
    try {
      _listOfTeam = await appsRepository.getAllTim();
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> editNameTim(TeamDetailModel teamDetail, PostTimModel tim) async {
    try {
      await appsRepository.updateTimName(teamDetail.id, tim);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }
}
