import 'dart:io';

import 'package:bantuin/models/file_note_client.dart';
import 'package:bantuin/models/note_detail_client_model.dart';
import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/models/password_model.dart';
import 'package:bantuin/models/post_forgot_password_model.dart';
import 'package:bantuin/models/post_password_model.dart';
import 'package:bantuin/models/post_user_model.dart';
import 'package:bantuin/models/product_point_model.dart';
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
  // AUTH
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
  }

  //NOTE BEGIN
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

  Future getDetailNote(int id) async {
    try {
      final response = await _apiService.getRequest('/notes/$id');
      NoteDetailClientModel noteDetail =
          NoteDetailClientModel.fromJson(response);
      print(noteDetail);
      return noteDetail;
    } catch (_) {
      rethrow;
    }
  }

  Future filterNote(String url) async {
    try {
      final response = await _apiService.getRequest('/notes$url');
      NoteModel noteDetail = NoteModel.fromJson(response);
      print(noteDetail);
      return noteDetail.notes;
    } catch (_) {
      rethrow;
    }
  }
  //NOTE END

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

  Future<void> updateImageProfile(
      {required int id, required File selectedFile}) async {
    try {
      await _apiService.putMultipart(
          '/users/$id', [selectedFile], {'photo': selectedFile.path}, 'photo');
    } catch (_) {
      rethrow;
    }
  }

  Future<void> updatePhotoProfile(int id, String photo) async {
    try {
      await _apiService.putRequest('/users/$id', photo);
    } catch (_) {
      rethrow;
    }
  }

    Future<void> postForgotPassword(PostForgotPasswordModel email) async {
    try {
      final response = await _apiService.postRequest('/forgot_password', email);
      print(response);
    } catch (_) {
      rethrow;
    }
  }

  // FEATURE TEAM
  Future<void> postAddTeam(PostTimModel tim) async {
    try {
      final response = await _apiService.postRequest('/teams', tim);
      print(response);
    } catch (_) {
      rethrow;
    }
  }

  Future getAllTeam() async {
    try {
      final response = await _apiService.getRequest('/teams');
      TeamModel team = TeamModel.fromJson(response);
      return team.team;
    } catch (_) {
      rethrow;
    }
  }

  Future updateTeam(int id, PostTimModel data) async {
    try {
      await _apiService.putRequest('/teams/$id', data);
    } catch (_) {
      rethrow;
    }
  }

  Future<void> postKickMember(String email, int id) async {
    try {
      final response = await _apiService.postRequest(
        '/teams/$id/kick_member',
        {
          "email": [email]
        },
      );
      print(response);
    } catch (_) {
      rethrow;
    }
  }

  //passowrd

  Future<void> updatePassword(PostPasswordModel passpost) async {
    try {
      await _apiService.putRequest('/update_password', passpost);
    } catch (_) {
      rethrow;
    }
  }

  //  FEATURE POINT BEGIN
  Future getProduct() async {
    try {
      final response = await _apiService.getRequest('/products');
      ProductPointModel point = ProductPointModel.fromJson(response);
      return point.product;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> postTransaction(int id, String type) async {
    try {
      await _apiService.postRequest(
        '/transactions',
        {
          "user_note_id": "$id",
          "point_type": type,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  //  FEATURE POINT END
}
