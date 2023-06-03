import 'package:bantuin/components/card_invitation.dart';
import 'package:bantuin/constants/constant.dart';
import 'package:bantuin/utils/app_state.dart';
import 'package:bantuin/view_models/invitation_viewmodel.dart';
import 'package:bantuin/widgets/shimmer_loading/shimmer_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class InvitationScreen extends StatefulWidget {
  const InvitationScreen({super.key});

  @override
  State<InvitationScreen> createState() => _InvitationScreenState();
}

class _InvitationScreenState extends State<InvitationScreen> {
  @override
  void initState() {
    // TODO: implement initState
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
        automaticallyImplyLeading: false,
        toolbarHeight: 76,
        title: Text(
          'Undangan',
          style: AppFont.regular20,
        ),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: Consumer<InvitationViewModel>(
        builder: (context, inv, child) {
          if (inv.appState == AppState.loading) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    height: 160,
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
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
                          child:
                              ShimmerContainer.circular(height: 50, width: 50),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ShimmerContainer.rectangle(
                                  height: 20,
                                  width: MediaQuery.of(context).size.width),
                              const SizedBox(height: 12),
                              ShimmerContainer.rectangle(
                                  height: 20,
                                  width:
                                      MediaQuery.of(context).size.width * 0.3),
                              const SizedBox(height: 12),
                              ShimmerContainer.rectangle(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            );
          }
          if (inv.appState == AppState.loaded) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: inv.listOfInvitation.length,
                itemBuilder: (context, index) {
                  var data = inv.listOfInvitation[index];
                  return CardInvitation(
                    invitationDetail: data,
                  );
                },
              ),
            );
          }
          if (inv.appState == AppState.noData) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                'Undangan masih kosong',
                style: AppFont.textScreenEmpty,
              ),
            );
          }
          if (inv.appState == AppState.failure) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                'Gagal mengambil undangan',
                style: AppFont.regular28,
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
