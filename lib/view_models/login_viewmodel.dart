import 'package:bantuin/models/login_model.dart';
import 'package:bantuin/services/api/login_api.dart';
import 'package:flutter/material.dart';

import '../services/api/apps_repository.dart';

class LoginViewModel with ChangeNotifier {
  final LoginApi _loginApi = LoginApi();
  final _appsRepository = AppsRepository();
  Future<void> postLogin(LoginModel login) async {
    try {
      // await _loginApi.postLogin(login);
      await _appsRepository.postLogin(login);
    } catch (_) {
      rethrow;
    }
  }
}
