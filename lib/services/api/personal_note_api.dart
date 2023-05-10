import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/models/post_note_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PersonalNoteApi {
  String baseUrl = 'https://bantuin.fly.dev/api/notes';
  String token =
      'eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjozOSwiZXhwIjoxNjgzNjg4OTcxfQ.eshUmJEyxJXo5lrSFOhjU81iG1msiIEXzyJkGpuLKMs';
  Future postApi(PostNoteModel note) async {
    var url = Uri.parse(baseUrl);
    var response = await http.post(
      url,
      body: json.encode(note.toJson()),
      headers: ({
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $token"
      }),
    );
    final responseBody = json.decode(response.body);
    print(responseBody);
  }

  Future<List<NoteModel>> getApi(String type) async {
    var url = Uri.parse(baseUrl);
    final response = await http.get(
      url,
      headers: ({
        "Content-Type": "application/json; charset=UTF-8",
        "Authorization": "Bearer $token"
      }),
    );
    final responseBody = json.decode(response.body)['data'];

    final listOfNotes =
        (responseBody as List).map((e) => NoteModel.fromJson(e)).toList();
    return listOfNotes;
    // return listOfNotes
    //     .where((element) => element.notesType!.toLowerCase().contains(type))
    //     .toList();
    // print(responseBody);
  }
}
