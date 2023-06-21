import 'package:bantuin/models/password_model.dart';
import 'package:bantuin/models/post_password_model.dart';
import 'package:bantuin/services/api/apps_repository.dart';
import 'package:flutter/material.dart';

class PasswordViewModel with ChangeNotifier {
  final AppsRepository appsRepository = AppsRepository();

  Future<void> updatePassword(PostPasswordModel passpost) async {
    try {
      await appsRepository.updatePassword(passpost);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }
}
