import 'package:bantuin/models/ringtone_model.dart';
import 'package:bantuin/services/api/apps_repository.dart';
import 'package:flutter/material.dart';

class RingtoneViewModel with ChangeNotifier {
  final appsRepository = AppsRepository();
  List<RingtoneDetailModel> _listOfRingtone = [];
  List<RingtoneDetailModel> get listOfRingtone => _listOfRingtone;

  void fetchRingtone() async {
    try {
      _listOfRingtone = await appsRepository.fetchRingtone();
      notifyListeners();
    } catch (e) {
      rethrow;
    }
  }
}
