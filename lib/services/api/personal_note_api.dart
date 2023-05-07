import 'package:bantuin/models/note_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PersonalNoteApi {
  String baseUrl = 'https://bantuin.fly.dev/api/notes';
  String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozOSwiZXhwIjoxNjgzNTE4NjEyfQ.1CnQ3P7I8GRNLHDTAxYUF2lFeYqw-KZjSn1cTupi0r0';
  Future postApi(NoteModel note) async {
    var url = Uri.parse(baseUrl);
    var response = await http.post(
      url,
      body: note.toJson(),
      headers: ({
        "Accept": "application/json",
        "Authorization": "Bearer $token"
      }),
    );
    final responseBody = json.decode(response.body)['data'];
    print(responseBody);
  }
}
