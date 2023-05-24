import 'dart:io';

import 'package:bantuin/models/file_note_client.dart';
import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/models/password_model.dart';
import 'package:bantuin/models/post_password_model.dart';
import 'package:bantuin/models/post_user_model.dart';
import 'package:bantuin/models/tim_model.dart';
import 'package:bantuin/models/user_models.dart';
import 'package:bantuin/services/api/api_services.dart';
import '../../models/login_model.dart';
import '../../models/post_note_model.dart';
import '../../models/post_tim_model.dart';
import '../../models/register_model.dart';
import '../../models/ringtone_model.dart';

class AppsRepository {
  final _apiService = ApiServices();

  Future<void> postLogin(LoginModel login) async {
    try {
      await _apiService.postLogin('/login', login);
    } catch (_) {
      rethrow;
    }
  }

  Future postRegister(RegisterModel register) async {
    try {
      await _apiService.postRequest('/register', register);
    } catch (_) {
      rethrow;
    }
    // var url = Uri.parse(baseUrl);
    // var response = await http.post(
    //   url,
    //   body: json.encode(note.toJson()),
    //   headers: ({
    //     "Content-Type": "application/json; charset=UTF-8",
    //     // "Authorization": "Bearer $token"
    //   }),
    // );

    // if (response.statusCode == 200 || response.statusCode == 201) {
    //   final responseBody = json.decode(response.body);
    //   print(responseBody);
    // } else if (response.statusCode == 404) {
    //   throw Exception("Endpoint not found");
    // } else if (response.statusCode == 422) {
    //   final responseBody = json.decode(response.body);
    //   throw Exception(responseBody['data']);
    // } else {
    //   throw Exception("Failed to post register");
    // }
  }

  Future<List<RingtoneDetailModel>> fetchRingtone() async {
    try {
      final response = await _apiService.getRequest('/ringtones');

      RingtoneModel ringtones = RingtoneModel.fromJson(response);

      return ringtones.ringtones;
    } catch (_) {
      rethrow;
    }
  }

  Future getPersonalNote() async {
    try {
      final response = await _apiService.getRequest('/notes');
      NoteModel ringtones = NoteModel.fromJson(response);
      // print(response);
      return ringtones.notes;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> postPersonalNote(PostNoteModel note) async {
    try {
      await _apiService.postRequest('/notes', note);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> updatePersonalNote(PostNoteModel note, int id) async {
    try {
      await _apiService.putRequest('/notes/$id', note);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> deletePersonalNote(int id) async {
    try {
      await _apiService.deleteRequest('/notes/$id');
    } catch (_) {
      rethrow;
    }
  }

  Future getNoteByStatus(String value) async {
    try {
      final response = await _apiService.getRequest('/notes');
      NoteModel ringtones = NoteModel.fromJson(response);
      // print(response);
      return ringtones.notes
          .where((element) =>
              element.status.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } catch (_) {
      rethrow;
    }
  }

  Future<void> postFileClient(
      {required String id, required List<File> selectedFile}) async {
    try {
      await _apiService.postMultipart(
          '/attaches', selectedFile, {'note_id': id}, 'path[]');
    } catch (_) {
      rethrow;
    }
  }

//profile
// profile user
  Future getUsers() async {
    try {
      final response = await _apiService.getRequest('/active_user');
      UsersDetailModel users = UsersDetailModel.fromJson(response['data']);
      return users;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> postUsers(PostUsersModel user) async {
    try {
      await _apiService.postRequest('/users', user);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> updateUsers(PostUsersModel user, int id) async {
    try {
      await _apiService.putRequest('/users/$id', user);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> postProfilePicture(
      {required String id, required List<File> selectedFile}) async {
    try {
      await _apiService.postMultipart(
          '/users/$id', selectedFile, {"photo": id}, "photo");
    } catch (_) {
      rethrow;
    }
  }

  // FEATURE TEAM
  Future<void> postAddTim(PostTimModel tim) async {
    try {
      final response = await _apiService.postRequest('/teams', tim);
      print(response);
    } catch (_) {
      rethrow;
    }
  }

  Future getAllTim() async {
    try {
      final response = await _apiService.getRequest('/teams');
      TeamModel team = TeamModel.fromJson(response);
      return team.team;
    } catch (_) {
      rethrow;
    }
  }

  Future updateTimName(int id, PostTimModel data) async {
    try {
      await _apiService.putRequest('/teams/$id', data);
    } catch (_) {
      rethrow;
    }
  }

  //passowrd
  Future getPassword() async {
    try {
      final response = await _apiService.getRequest('/update_password');
      PasswordModel pass = PasswordModel.fromJson(response['data']);
      return pass;
    } catch (_) {
      rethrow;
    }
  }

  Future<void> postPassword(PostPasswordModel passpost) async {
    try {
      await _apiService.postRequest('/update_password', passpost);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> updatePassword(PostPasswordModel passpost, int id) async {
    try {
      await _apiService.putRequest('/update_password/$id', passpost);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> postProfilePhoto(UsersDetailModel user, int id) async {
    try {
      await _apiService.postRequest('/users/$id', user);
    } catch (_) {
      rethrow;
    }
  }
}
