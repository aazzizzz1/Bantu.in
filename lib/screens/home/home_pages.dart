import 'package:bantuin/components/card_incoming_notes.dart';
import 'package:bantuin/components/card_mynotes.dart';
import 'package:bantuin/components/card_mynotes_personal.dart';
import 'package:bantuin/components/floating_home.dart';
import 'package:bantuin/components/daftar_catatan.dart';
import 'package:bantuin/components/list_daftar_catatan.dart';
import 'package:bantuin/components/point_royalty.dart';
import 'package:bantuin/constants/button/app_button.dart';
import 'package:bantuin/screens/note/notes_form.dart';
import 'package:bantuin/screens/note/notes_form.dart';
import 'package:bantuin/screens/notification/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../constants/font/app_font.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 76,
        titleSpacing: 15,
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Image.asset("lib/assets/images/Switch.png"),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nama",
              style: AppFont.semiBold14,
            ),
            Text(
              "Pekerjaan",
              style: AppFont.regular12,
            ),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 20),
            child: IconButton(
              splashRadius: 20,
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NotificationScreen(),
              )),
              icon: const Icon(
                Icons.notifications_none_outlined,
                color: AppColorNeutral.neutral4,
                size: 30,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Stack(
        children: [
          // content of the page
          PointRoyalty(),
          DaftarCatatan(),
          ListDaftarCatatan(),
          // floating button above bottom navbar
          Positioned(
            bottom: 80,
            right: 16.0,
            child: FloatingButtonHome(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NotesForm()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
