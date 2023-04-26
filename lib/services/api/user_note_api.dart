import 'dart:convert';
import 'dart:io';

import 'package:bantuin/models/user_note_model.dart';
import 'package:http/http.dart' as http;

class UserNoteApi {
  Future<dynamic> getUserNote(String url) async {
    final response = await http.get(Uri.parse('$url'));
    final responseBody = json.decode(response.body);
    final listOfNotes =
        (responseBody as List).map((e) => UserNotesModel.fromJson(e)).toList();
    return listOfNotes;
    // try {
    //   final response = await http.get(
    //     Uri.parse('$url'),
    //   );
    //   return returnResponse(response);
    // } on SocketException {
    //   throw 'No Internet Connection';
    // }
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
