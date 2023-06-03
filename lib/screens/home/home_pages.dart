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
import 'package:bantuin/utils/app_state.dart';
import 'package:bantuin/view_models/invitation_viewmodel.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
import 'package:bantuin/view_models/product_viewmodel.dart';
import 'package:bantuin/widgets/floating_button/floating_home.dart';
import 'package:bantuin/widgets/home/filtering_data.dart';
import 'package:bantuin/widgets/shimmer_loading/shimmer_container.dart';
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
    Future.microtask(() =>
        Provider.of<InvitationViewModel>(context, listen: false)
            .fetchInvitation());
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
        title: Consumer<UsersViewModel>(builder: (context, user, child) {
          if (user.appState == AppState.loading) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                ShimmerContainer.rectangle(height: 10, width: 50),
                SizedBox(height: 10),
                ShimmerContainer.rectangle(height: 10, width: 100),
              ],
            );
          }

          if (user.appState == AppState.loaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.listOfUsers.username,
                  style: AppFont.semiBold14,
                ),
                Text(
                  user.listOfUsers.job,
                  style: AppFont.regular12,
                ),
              ],
            );
          }
          if (user.appState == AppState.noData) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Kosong',
                  style: AppFont.semiBold14,
                ),
                Text(
                  'Kosong',
                  style: AppFont.regular12,
                ),
              ],
            );
          }
          if (user.appState == AppState.failure) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pengguna',
                  style: AppFont.semiBold14,
                ),
                Text(
                  'Pekerjaan',
                  style: AppFont.regular12,
                ),
              ],
            );
          }
          return const SizedBox();
        }),
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
              Consumer<InvitationViewModel>(
                builder: (context, inv, child) {
                  if (inv.appState == AppState.loading) {
                    return _loadingInvitation();
                  }
                  if (inv.appState == AppState.loaded) {
                    return HomeInvitaion();
                  }
                  if (inv.appState == AppState.noData) {
                    return const SizedBox();
                  }
                  if (inv.appState == AppState.failure) {
                    return const SizedBox();
                  }
                  return const SizedBox();
                },
              ),
              DaftarCatatan(),
              ListDaftarCatatan(),
            ],
          ),
        ),
      ),
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

  Widget _loadingInvitation() {
    return Container(
      height: 250,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Permintaan Masuk',
            style: AppFont.textTitleScreen,
          ),
          Container(
            height: 160,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              border: const Border.fromBorderSide(
                BorderSide(color: AppColorNeutral.neutral2, width: 1),
              ),
              borderRadius: BorderRadius.circular(4),
              color: AppColorNeutral.neutral1,
            ),
            child: Row(
              children: [
                const Align(
                  alignment: Alignment.topCenter,
                  child: ShimmerContainer.circular(height: 50, width: 50),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ShimmerContainer.rectangle(
                          height: 20, width: MediaQuery.of(context).size.width),
                      const SizedBox(height: 12),
                      ShimmerContainer.rectangle(
                          height: 20,
                          width: MediaQuery.of(context).size.width * 0.3),
                      const SizedBox(height: 12),
                      ShimmerContainer.rectangle(
                          height: 50, width: MediaQuery.of(context).size.width),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
