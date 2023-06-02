import 'package:bantuin/models/login_model.dart';
import 'package:bantuin/models/post_forgot_password_model.dart';
import 'package:bantuin/services/api/api_services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/api/apps_repository.dart';

class LoginViewModel with ChangeNotifier {
  final ApiServices _loginApi = ApiServices();
  final _appsRepository = AppsRepository();

  Future<void> postLogin(LoginModel login) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('password', login.password);
    print(prefs.getString('password'));
    try {
      // await _loginApi.postLogin(login);
      await _appsRepository.postLogin(login);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    notifyListeners();
  }

  Future<void> forgotPassword(PostForgotPasswordModel email) async {
    try {
      await _appsRepository.postForgotPassword(email);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }

}
