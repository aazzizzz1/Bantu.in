import 'package:bantuin/models/user_models.dart';
import 'package:bantuin/screens/home/home_pages.dart';
import 'package:bantuin/screens/invitation/invitation_screen.dart';
import 'package:bantuin/screens/note/notes_screen.dart';
import 'package:bantuin/screens/profile/profile_screen.dart';
import 'package:bantuin/screens/tim/tim_screen.dart';
import 'package:flutter/cupertino.dart';

class ListMenu {
  int currentTab = 0;
  late final UsersDetailModel users;
  List<Widget> screens = [];

  ListMenu(int tab, Widget screen, UsersDetailModel initialUsers) {
    currentTab = tab;
    users = initialUsers;
    screens = [
      const HomePages(),
      const NoteScreen(),
      const TimScreen(),
      const InvitationScreen(),
      ProfileScreen(users: users),
    ];
  }
}
