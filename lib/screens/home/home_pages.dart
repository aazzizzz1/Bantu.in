import 'package:bantuin/components/card_incoming_notes_upload.dart';
import 'package:bantuin/components/card_mynotes_personal.dart';
import 'package:bantuin/components/card_mynotes_progres.dart';
import 'package:bantuin/components/daftar_catatan.dart';
import 'package:bantuin/components/home_invitation.dart';
import 'package:bantuin/components/list_daftar_catatan.dart';
import 'package:bantuin/components/point_royalty.dart';
import 'package:bantuin/constants/button/app_button.dart';
import 'package:bantuin/constants/font/app_font.dart';
import 'package:bantuin/screens/note/notes_form.dart';
import 'package:bantuin/screens/notification/notification_screen.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
import 'package:bantuin/view_models/product_viewmodel.dart';
import 'package:bantuin/widgets/floating_button/floating_home.dart';
import 'package:bantuin/widgets/home/filtering_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../view_models/user_viewmodel.dart';

import '../../view_models/ringtone_viewmodel.dart';
import '../note/note_form2.dart';

class HomePages extends StatefulWidget {
  const HomePages({Key? key}) : super(key: key);

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  void initState() {
    // TODO: implement initState

    Future.microtask(() =>
        Provider.of<NoteViewModel>(context, listen: false).getPersonalNote());
    Future.microtask(() =>
        Provider.of<RingtoneViewModel>(context, listen: false).fetchRingtone());
    Future.microtask(() =>
        Provider.of<ProductViewModel>(context, listen: false).fetchProduct());
    Future.microtask(
        () => Provider.of<UsersViewModel>(context, listen: false).getUsers());
    super.initState();
  }

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
        title: Consumer<UsersViewModel>(
          builder: (context, value, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value.listOfUsers.username,
                style: AppFont.semiBold14,
              ),
              Text(
                value.listOfUsers.job,
                style: AppFont.regular12,
              ),
            ],
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: IconButton(
              splashRadius: 20,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NotificationScreen(),
                ));
              },
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
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          child: Column(
            children: [
              PointRoyalty(),
              HomeInvitaion(),
              DaftarCatatan(),
              ListDaftarCatatan(),
            ],
          ),
        ),
      ),
      // ListView(
      //   children: const [
      //   ],
      // ),
      floatingActionButton: FloatingButtonHome(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NoteForm2()),
          );
        },
      ),
    );
  }
}
