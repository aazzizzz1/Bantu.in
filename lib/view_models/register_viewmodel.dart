import 'package:bantuin/models/register_model.dart';
import 'package:bantuin/services/api/api_services.dart';
import 'package:bantuin/services/api/apps_repository.dart';
import 'package:flutter/material.dart';

class RegisterViewModel with ChangeNotifier {
  final ApiServices _registerApi = ApiServices();
  final _appsRepository = AppsRepository();

  Future<void> postRegister(RegisterModel register) async {
    try {
      await _appsRepository.postRegister(register);
      // await _registerApi.postRegister(register);
    } catch (_) {
      rethrow;
    }
  }
}
