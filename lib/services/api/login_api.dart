import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bantuin/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginApi {
  String baseUrl = 'https://bantuin.fly.dev/api/login';
  Future postLogin(LoginModel note) async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();

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

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
    } else if (response.statusCode == 404) {
      throw Exception("Endpoint not found");
    } else if (response.statusCode == 422) {
      final responseBody = json.decode(response.body);
      throw Exception(responseBody['message']);
    } else {
      throw Exception("Failed to post login");
    }

    final responseBody = json.decode(response.body);
    print(responseBody);
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
    // print(responseBody);
  }
}

  // if (response.statusCode == 200) {
  //     prefs.setString(
  //       'token',
  //       json.decode(response.body)['data']['token'],
  //     );
  //     prefs.setInt('userid', json.decode(response.body)['data']['user']['id']);
  //     prefs.setString(
  //         'phone', json.decode(response.body)['data']['user']['phone']);
  //     prefs.setString(
  //         'email', json.decode(response.body)['data']['user']['email']);
  //     prefs.setString(
  //         'name', json.decode(response.body)['data']['user']['username']);
  //     return json.decode(response.body)['info'];
  //   }