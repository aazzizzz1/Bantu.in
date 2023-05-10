import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../base_url.dart';

class ApiServices {
  // String baseUrl = 'https://bantuin.fly.dev/api/notes';
  String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozOSwiZXhwIjoxNjgzNjg4OTcxfQ.eshUmJEyxJXo5lrSFOhjU81iG1msiIEXzyJkGpuLKMs';
  @override
  Future<dynamic> postRequest(String url, data) async {
    // SharedPreferences? prefs = await SharedPreferences.getInstance();
    // String token = prefs.getString('token').toString();
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$url'),
        body: data is Map ? json.encode(data) : json.encode(data.toJson()),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer $token",
        },
      );
      return returnResponse(response);
    } on SocketException {
      throw 'No Internet Connection';
    }
  }

  @override
  Future<dynamic> getRequest(String url) async {
    // SharedPreferences? prefs = await SharedPreferences.getInstance();
    // String token = prefs.getString('token').toString();

    try {
      final response = await http.get(
        Uri.parse('$baseUrl$url'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      return returnResponse(response);
    } on SocketException {
      throw 'No Internet Connection';
    }
  }

  @override
  Future deleteRequest(String url) async {
    // SharedPreferences? prefs = await SharedPreferences.getInstance();
    // String token = prefs.getString('token').toString();

    try {
      final response = await http.delete(
        Uri.parse('$baseUrl$url'),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          'Authorization': 'Bearer $token',
        },
      );
      return returnResponse(response);
    } on SocketException {
      throw 'No Internet Connection';
    }
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw json.decode(response.body)['info'];
      case 401:
        throw json.decode(response.body)['info'];
      case 404:
        throw json.decode(response.body)['info'];
      case 500:
        throw json.decode(response.body)['info'];
      default:
        throw "Error accourded while communicating with server with status code ${response.statusCode}";
    }
  }
}
