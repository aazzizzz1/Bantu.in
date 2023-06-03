import 'package:bantuin/components/card_invitation.dart';
import 'package:bantuin/components/home_card_invitation.dart';
import 'package:bantuin/screens/invitation/invitation_screen.dart';
import 'package:bantuin/view_models/invitation_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../constants/constant.dart';
import '../screens/home/home_pages.dart';
import '../widgets/bottom_navigation/bottom_menu.dart';

class HomeInvitaion extends StatefulWidget {
  const HomeInvitaion({super.key});

  @override
  State<HomeInvitaion> createState() => HomeInvitaionState();
}

class HomeInvitaionState extends State<HomeInvitaion> {
  @override
  Widget build(BuildContext context) {
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
          Text(
            'Daftar catatan dan undangan grub masuk',
            style: AppFont.medium14,
          ),
          Consumer<InvitationViewModel>(
            builder: (context, inv, child) {
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 1,
                itemBuilder: (context, index) {
                  if (inv.listOfInvitation.length > 1) {
                    return Column(
                      children: [
                        CardInvitation(
                            invitationDetail: inv.listOfInvitation.first),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '${inv.listOfInvitation.length - 1} Permintaan masuk.',
                              style: AppFont.medium14,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BottomMenu(
                                          currentTab: 3,
                                          currentScreen:
                                              const InvitationScreen())),
                                );
                              },
                              child: Text(
                                'Lihat permintaan.',
                                style: AppFont.textButtonActive,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                  return CardInvitation(
                      invitationDetail: inv.listOfInvitation.first);
                },
              );
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '3 Permintaan masuk.',
                style: AppFont.medium14,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BottomMenu(
                            currentTab: 3,
                            currentScreen: const InvitationScreen())),
                  );
                },
                child: Text(
                  'Lihat permintaan.',
                  style: AppFont.textButtonActive,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
