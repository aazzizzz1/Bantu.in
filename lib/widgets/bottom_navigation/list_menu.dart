import 'package:bantuin/screens/home/home_pages.dart';
import 'package:bantuin/screens/invitation/invitation_screen.dart';
import 'package:bantuin/screens/note/notes_screen.dart';
import 'package:bantuin/screens/profile/profile_screen.dart';
import 'package:bantuin/screens/tim/tim_screen.dart';
import 'package:flutter/cupertino.dart';

class ListMenu{
  int currentTab = 0;

  ListMenu(int tab,Widget screen){
    currentTab = tab;
  }
  final List<Widget> screens = [
    const HomePages(),
    const NoteScreen(),
    const TimScreen(),
    const InvitationScreen(),
    const ProfileScreen(),
  ];
}