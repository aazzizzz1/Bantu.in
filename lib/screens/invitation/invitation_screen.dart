import 'package:bantuin/components/card_invitation.dart';
import 'package:bantuin/components/home_card_invitation.dart';
import 'package:bantuin/constants/button/app_button.dart';
import 'package:flutter/material.dart';

import '../../constants/font/app_font.dart';

class InvitationScreen extends StatefulWidget {
  const InvitationScreen({super.key});

  @override
  State<InvitationScreen> createState() => _InvitationScreenState();
}

class _InvitationScreenState extends State<InvitationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 76,
        title: Text(
          'Undangan',
          style: AppFont.regular20,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: CardInvitation(),
    );
  }
}
