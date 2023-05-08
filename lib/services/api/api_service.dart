import 'dart:convert';

import 'package:bantuin/models/user_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String BASE_URL = 'https://bantuin.fly.dev/api';

  Future<http.Response> register(User user) async {
    final response = await http.post(
      Uri.parse('$BASE_URL/register'),
      headers: ({
        "Content-Type": "application/json; charset=UTF-8",
        "Accept": "application/json",}),
      body: jsonEncode(user.toJson()),
    );

    if (response.statusCode == 201) {
      return response;
    } else if (response.statusCode == 422) {
      final errorMessage = jsonDecode(response.body)['message'];
      throw FormatException(errorMessage);
    } else {
      throw Exception('Registration failed with status code ${response.statusCode}');
    }
  }
}
