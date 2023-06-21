import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/login_model.dart';
import '../../models/post_note_model.dart';
import '../base_url.dart';

class ApiServices {
  Future postLogin(String url, LoginModel login) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var response = await http.post(
      Uri.parse('$baseUrl$url'),
      body: json.encode(login.toJson()),
      headers: ({
        "Content-Type": "application/json; charset=UTF-8",
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseBody = json.decode(response.body);
      print(responseBody);
      prefs.setString(
        'token',
        json.decode(response.body)['token'],
      );
      prefs.setInt('id', json.decode(response.body)['data']['id']);
      prefs.setString(
          'username', json.decode(response.body)['data']['username']);
      prefs.setString('email', json.decode(response.body)['data']['email']);
      prefs.setString('phone', json.decode(response.body)['data']['phone']);
      prefs.setString('job', json.decode(response.body)['data']['job']);
      return returnResponse(response);
    } else if (response.statusCode == 404) {
      throw json.decode(response.body)['error'] ??
          json.decode(response.body)['message'];
    } else if (response.statusCode == 403) {
      final responseBody = json.decode(response.body);
      throw json.decode(response.body)['error'] ??
          json.decode(response.body)['message'];
    } else if (response.statusCode == 422) {
      final responseBody = json.decode(response.body);
      throw json.decode(response.body)['error'] ??
          json.decode(response.body)['message'];
    } else {
      final responseBody = json.decode(response.body);
      print(responseBody);
      throw json.decode(response.body)['error'] ??
          json.decode(response.body)['message'];
    }
  }

  @override
  Future<dynamic> postRequest(String url, data) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
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
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    try {
      final response = await http.get(
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

  @override
  Future deleteRequest(String url, data) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    try {
      final response = await http.delete(
        Uri.parse('$baseUrl$url'),
        body: data is Map ? json.encode(data) : json.encode(data.toJson()),
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

  Future<dynamic> putRequest(String url, data) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    try {
      final response = await http.put(
        Uri.parse('$baseUrl$url'),
        body: data is Map ? json.encode(data) : json.encode(data.toJson()),
        headers: {
          "Content-Type": "application/json; charset=UTF-8",
          "Authorization": "Bearer $token"
        },
      );
      return returnResponse(response);
    } on SocketException {
      throw 'No Internet Connection';
    }
  }

  @override
  Future postMultipart(String url, List<File>? files, Map<String, String> body,
      String noteKey) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    try {
      var request = http.MultipartRequest("POST", Uri.parse('$baseUrl$url'));

      request.headers.addAll({
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $token"
      });

      request.fields.addAll(body);

      if (files != null) {
        for (var file in files) {
          request.files
              .add(await http.MultipartFile.fromPath(noteKey, file.path));
        }
      }

      var sendRequest = await request.send();
      var response = await http.Response.fromStream(sendRequest);
      return returnResponse(response);
    } on SocketException {
      throw 'No Internet Connection';
    }
  }

  @override
  Future putMultipart(String url, List<File>? files, Map<String, String> body,
      String noteKey) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    try {
      var request = http.MultipartRequest("PUT", Uri.parse('$baseUrl$url'));

      request.headers.addAll({
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $token"
      });

      request.fields.addAll(body);

      if (files != null) {
        for (var file in files) {
          request.files
              .add(await http.MultipartFile.fromPath(noteKey, file.path));
        }
      }

      var sendRequest = await request.send();
      var response = await http.Response.fromStream(sendRequest);
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
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        final responseBody = json.decode(response.body);
        print(responseBody);
        throw json.decode(response.body)['message'] ?? json.decode(response.body)['error'];
      case 401:
        final responseBody = json.decode(response.body);
        print(responseBody);
        // throw Exception(json.decode(response.body)['message']);
        throw json.decode(response.body)['message'] ?? json.decode(response.body)['error'];
      case 404:
        final responseBody = json.decode(response.body);
        print(responseBody);
        throw Exception(json.decode(response.body)['message'] ?? json.decode(response.body)['error']);
      // throw json.decode(response.body)['message'];
      case 422:
        final responseBody = json.decode(response.body);
        print(responseBody);
        // throw Exception(json.decode(response.body)['message']);
        // throw json.decode(response.body)['message'];
        throw json.decode(response.body)['data'] ??
            json.decode(response.body)['message'] ?? json.decode(response.body)['error'];
      case 500:
        final responseBody = json.decode(response.body);
        print(responseBody);
        // throw Exception(json.decode(response.body)['message']);
        throw json.decode(response.body)['message'] ?? json.decode(response.body)['error'];
      default:
        // throw Exception(
        final responseBody = json.decode(response.body);
        print(responseBody);
        //     "Error accourded while communicating with server with status code ${response.statusCode}");
        throw "Error accourded while communicating with server with status code ${response.statusCode}";
    }
  }
}