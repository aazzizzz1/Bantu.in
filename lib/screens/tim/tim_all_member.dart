import 'package:bantuin/models/user_models.dart';
import 'package:bantuin/screens/tim/tim_add_member.dart';
import 'package:bantuin/utils/app_state.dart';
import 'package:bantuin/view_models/tim_view_model.dart';
import 'package:bantuin/widgets/shimmer_loading/shimmer_container.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

import '../../constants/constant.dart';
import '../../models/tim_model.dart';
import '../../widgets/shimmer_loading/shimmer_card_widget.dart';

class TimAllMember extends StatefulWidget {
  final TeamDetailModel timdetail;
  TimAllMember({super.key, required this.timdetail});

  @override
  State<TimAllMember> createState() => _TimAllMemberState();
}

class _TimAllMemberState extends State<TimAllMember> {
  late List<UsersDetailModel> participants;

  @override
  void initState() {
    // TODO: implement initState
    participants = widget.timdetail.participant;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 76,
        titleSpacing: 15,
        leading: IconButton(
          highlightColor: Colors.transparent,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          alignment: Alignment.center,
          splashColor: AppColorNeutral.neutral1,
          splashRadius: 25,
          iconSize: 30,
        ),
        title: Text(
          'Semua anggota',
          style: AppFont.semiBold14,
        ),
        actions: [
          Icon(Icons.menu),
          Container(
            margin: const EdgeInsets.only(right: 20),
            child: IconButton(
              splashRadius: 20,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => TimAddMember(
                    teamDetail: widget.timdetail,
                  ),
                ));
              },
              icon: SvgPicture.asset(
                'lib/assets/icons/Add user.svg',
                height: 30,
                width: 30,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Consumer<TeamViewModel>(
        builder: (context, teamMember, child) {
          if (teamMember.appState == AppState.loading) {
            return _loadingContainer();
          }
          if (teamMember.appState == AppState.loaded) {
            // return _loadingContainer();
            return Container(
              margin: const EdgeInsets.all(16),
              child: ListView.builder(
                itemCount: teamMember.detailTeam.participant.length,
                itemBuilder: (context, index) {
                  var data = teamMember.detailTeam.participant[index];
                  return cardParticipant(data);
                },
              ),
            );
          }
          if (teamMember.appState == AppState.noData) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                'Tidak ada anggota tim',
                style: AppFont.textScreenEmpty,
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget cardParticipant(UsersDetailModel user) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8.0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColorNeutral.neutral2),
        borderRadius: BorderRadius.circular(6.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CachedNetworkImage(
                imageUrl: user.photo,
                // placeholder: (context, url) =>
                //     const CircularProgressIndicator(),
                // errorWidget: (context, url, error) => const Icon(Icons.error),
                imageBuilder: (context, imageProvider) => CircleAvatar(
                  backgroundImage: imageProvider,
                  radius: 20.0,
                ),
              ),
              const SizedBox(width: 18),
              Text(
                user.username,
                style: AppFont.semiBold14,
              ),
            ],
          ),
          IconButton(
            onPressed: () async {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      'Apakah anda yakin ingin mengeluarkan anggota ini?',
                      textAlign: TextAlign.center,
                      style: AppFont.textSubjectOrTitle,
                    ),
                    actions: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  overlayColor: MaterialStatePropertyAll(
                                      AppColorNeutral.neutral2),
                                  padding: MaterialStatePropertyAll(
                                    EdgeInsets.symmetric(
                                        horizontal: 28, vertical: 10),
                                  ),
                                  elevation: MaterialStatePropertyAll(0),
                                  side: MaterialStatePropertyAll(BorderSide(
                                      color: AppColorNeutral.neutral2)),
                                  backgroundColor:
                                      MaterialStatePropertyAll(Colors.white),
                                ),
                                onPressed: () async {
                                  // Perform delete operation and navigate back to previous screen
                                  // ...
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Batal',
                                  style: AppFont.textButtonDisable,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16.0),
                            Consumer<TeamViewModel>(
                              builder: (context, team, child) {
                                return Expanded(
                                  child: ElevatedButton(
                                    style: const ButtonStyle(
                                      overlayColor: MaterialStatePropertyAll(
                                          AppColorRed.red4),
                                      padding: MaterialStatePropertyAll(
                                        EdgeInsets.symmetric(
                                            horizontal: 28, vertical: 10),
                                      ),
                                      elevation: MaterialStatePropertyAll(0),
                                      // side: MaterialStatePropertyAll(
                                      //     BorderSide(color: AppColorPrimary.primary6)),
                                      backgroundColor: MaterialStatePropertyAll(
                                          AppColorRed.red6),
                                    ),
                                    onPressed: () async {
                                      // Perform delete operation and navigate back to previous screen
                                      // ...
                                      try {
                                        await team
                                            .kickMemberTeam(
                                                widget.timdetail, user.email)
                                            .then((value) =>
                                                Fluttertoast.showToast(
                                                    msg:
                                                        'member berhasil dihapus'))
                                            .then((value) =>
                                                Navigator.pop(context))
                                            .then((value) => team.getDetailTeam(
                                                widget.timdetail));
                                      } catch (e) {
                                        await Fluttertoast.showToast(
                                            msg: e.toString());
                                      }
                                    },
                                    child: Text(
                                      'Iya',
                                      style: AppFont.textFillButtonActive,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: SvgPicture.asset(
              'lib/assets/icons/Thrash.svg',
              color: AppColorRed.red6,
            ),
          ),
        ],
      ),
    );
  }

  Widget _loadingContainer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            children: [
              ShimmerContainer.circular(
                height: 70,
                width: MediaQuery.of(context).size.width * 0.85,
                shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              const SizedBox(height: 8),
            ],
          );
        },
      ),
    );
  }
}
