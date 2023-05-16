import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:bantuin/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApi {
  String baseUrl = 'https://bantuin.fly.dev/api/login';
  Future postLogin(LoginModel note) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    var url = Uri.parse(baseUrl);
    var response = await http.post(
      url,
      // body: note.toJson(),
      body: json.encode(note.toJson()),
      headers: ({
        "Content-Type": "application/json; charset=UTF-8",
        // "Authorization": "Bearer $token"
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
          final responseBody = json.decode(response.body);
          print(responseBody);        
        prefs.setString(
          'token',
          json.decode(response.body)['token'],
        );
        prefs.setInt(
            'id', json.decode(response.body)['data']['id']);
        prefs.setString(
            'username', json.decode(response.body)['data']['username']);
        prefs.setString(
            'email', json.decode(response.body)['data']['email']);
        prefs.setString(
            'phone', json.decode(response.body)['data']['phone']);
        prefs.setString(
            'job', json.decode(response.body)['data']['job']);
        return returnResponse(response);
      }else if (response.statusCode == 404) {
      throw Exception("Endpoint not found");
    } else if (response.statusCode == 422) {
      final responseBody = json.decode(response.body);
      throw Exception(responseBody['message']);
    } else {
      final responseBody = json.decode(response.body);
      print(responseBody);        
      throw Exception(responseBody['error']);
    }

  }

    @override
  Future<dynamic> postRequest(String url, data) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();
    try {
      final response = await http.post(
        Uri.parse('$baseUrl$url'),
        body: data is Map ? data : data.toJson(),
        headers: {
          'Authorization': 'Bearer $token',
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
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    try {
      final response = await http.delete(
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
  Future postMulipart(String url, List<File>? files, Map<String, String> body,
      String imageKey) async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token').toString();

    try {
      var request = http.MultipartRequest("POST", Uri.parse('$baseUrl$url'));

      request.headers.addAll({"Authorization": "Bearer $token"});

      request.fields.addAll(body);

      if (files != null) {
        for (var file in files) {
          request.files
              .add(await http.MultipartFile.fromPath(imageKey, file.path));
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

  Future<List<LoginModel>> getLogin(String type) async {
    var url = Uri.parse(baseUrl);
    final response = await http.get(
      url,
      headers: ({
        "Content-Type": "application/json; charset=UTF-8",
      }),
    );
    final responseBody = json.decode(response.body)['data'];

    final listOfNotes =
        (responseBody as List).map((e) => LoginModel.fromJson(e)).toList();
    return listOfNotes;
    // return listOfNotes
    //     .where((element) => element.notesType!.toLowerCase().contains(type))
    //     .toList();
  }
}
