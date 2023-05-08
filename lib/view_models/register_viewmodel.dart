import 'package:bantuin/models/register_model.dart';
import 'package:bantuin/services/api/register_api.dart';
import 'package:flutter/material.dart';

class RegisterViewModel with ChangeNotifier {
  final RegisterApi _registerApi = RegisterApi();

  Future<void> postRegister(RegisterModel register) async {
    try {
      await _registerApi.postRegister(register);
    } catch (_) {
      rethrow;
    }
  }
}
