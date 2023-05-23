import 'package:bantuin/models/login_model.dart';
import 'package:bantuin/services/api/api_services.dart';
import 'package:flutter/material.dart';

import '../services/api/apps_repository.dart';

class LoginViewModel with ChangeNotifier {
  final ApiServices _loginApi = ApiServices();
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
