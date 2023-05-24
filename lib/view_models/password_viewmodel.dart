import 'package:bantuin/models/password_model.dart';
import 'package:bantuin/models/post_password_model.dart';
import 'package:bantuin/services/api/apps_repository.dart';
import 'package:flutter/material.dart';

class PasswordViewModel with ChangeNotifier {
  final AppsRepository appsRepository = AppsRepository();

  late PasswordModel _listOfPassword = PasswordModel(
      id: 0, current_password: '', password: '', password_confirmation: '');
  PasswordModel get listOfPassword => _listOfPassword;

  Future<void> getPassword() async {
    try {
      _listOfPassword = await appsRepository.getPassword();
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> postPassword(PostPasswordModel passpost) async {
    try {
      await appsRepository.postPassword(passpost);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updatePassword(PostPasswordModel passpost, PasswordModel pass) async {
    print(pass.id);
    try {
      await appsRepository.updatePassword(passpost, pass.id);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }
}
