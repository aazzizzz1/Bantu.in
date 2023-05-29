import 'dart:io';

import 'package:bantuin/models/post_user_model.dart';
import 'package:bantuin/models/user_models.dart';
import 'package:bantuin/services/api/apps_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersViewModel with ChangeNotifier {
  final AppsRepository appsRepository = AppsRepository();

  late UsersDetailModel _listOfUsers = UsersDetailModel(
    id: 0,
    username: '',
    email: '',
    phone: '',
    job: '',
    photo: '',
    notesCount: 0,
    point: 0,
  );
  UsersDetailModel get listOfUsers => _listOfUsers;

  Future<void> getUsers() async {
    try {
      _listOfUsers = await appsRepository.getUsers();
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> postUsers(PostUsersModel user) async {
    try {
      await appsRepository.postUsers(user);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateUsers(PostUsersModel user, UsersDetailModel users) async {
    print(users.id);
    try {
      await appsRepository.updateUsers(user, users.id);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateProfilePicture(UsersDetailModel users, Photo photo) async {
    try {
      await photo.upload(users.id); // Upload the image
      await appsRepository.updatePhotoProfile(users.id, photo.photo.path);
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateImageProfile(
      {required int id, required File selectedFile}) async {
    try {
      await appsRepository.updateImageProfile(
          id: id, selectedFile: selectedFile);
      notifyListeners();
    } catch (_) {
      rethrow;
    }
  }
}
