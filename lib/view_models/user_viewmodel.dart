import 'package:bantuin/models/post_note_model.dart';
import 'package:bantuin/models/post_user_model.dart';
import 'package:bantuin/models/user_models.dart';
import 'package:bantuin/services/api/api_services.dart';
import 'package:bantuin/services/api/apps_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersViewModel with ChangeNotifier {
  final AppsRepository appsRepository = AppsRepository();
  final ApiServices apiService = ApiServices();

  List<UsersDetailModel> _listOfUsers = [];
  List<UsersDetailModel> get listOfUsers => _listOfUsers;

  Future<void> getUsers() async {
    try {
      List<dynamic> usersData = await appsRepository.getUsers();
      _listOfUsers = usersData.map((userData) => UsersDetailModel.fromJson(userData)).toList();
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
}
