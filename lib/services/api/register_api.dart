import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:bantuin/models/register_model.dart';

class RegisterApi {
  String baseUrl = 'https://bantuin.fly.dev/api/register';
  Future postRegister(RegisterModel note) async {
    var url = Uri.parse(baseUrl);
    var response = await http.post(
      url,
      body: json.encode(note.toJson()),
      headers: ({
        "Content-Type": "application/json; charset=UTF-8",
        // "Authorization": "Bearer $token"
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final responseBody = json.decode(response.body);
      print(responseBody);
    } else if (response.statusCode == 404) {
      throw Exception("Endpoint not found");
    } else if (response.statusCode == 422) {
      final responseBody = json.decode(response.body);
      throw Exception(responseBody['data']);
    } else {
      throw Exception("Failed to post register");
    }
    final responseBody = json.decode(response.body);
    print(responseBody);
  }

  Future<List<RegisterModel>> getRegister(String type) async {
    var url = Uri.parse(baseUrl);
    final response = await http.get(
      url,
      headers: ({
        "Content-Type": "application/json; charset=UTF-8",
      }),
    );
    final responseBody = json.decode(response.body)['data'];

    final listOfNotes =
        (responseBody as List).map((e) => RegisterModel.fromJson(e)).toList();
    return listOfNotes;
    // return listOfNotes
    //     .where((element) => element.notesType!.toLowerCase().contains(type))
    //     .toList();
    // print(responseBody);
  }
}


// class RegisterApi {
//   Future<String> postRegister(RegisterModel register) async {
//     var url = Uri.parse("https://bantuin.fly.dev/api/register");

//     var response = await http.post(url, body: register.toJson());
//     if (response.statusCode == 200) {
//       return json.decode(response.body)['info'];
//     }
//     return throw json.decode(response.body)['info'];
//   }
// }
