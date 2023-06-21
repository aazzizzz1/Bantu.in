import 'package:bantuin/components/card_mynotes_admin.dart';
import 'package:bantuin/components/card_mynotes_client.dart';
import 'package:bantuin/components/card_mynotes_personal.dart';
import 'package:bantuin/screens/tim/card_team.dart';
import 'package:bantuin/utils/app_state.dart';
import 'package:bantuin/view_models/tim_view_model.dart';
import 'package:bantuin/widgets/shimmer_loading/shimmer_card_team.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constant.dart';
import '../widgets/shimmer_loading/shimmer_card_widget.dart';

class ListDaftarTim extends StatefulWidget {
  const ListDaftarTim({super.key});

  @override
  State<ListDaftarTim> createState() => _ListDaftarTimState();
}

class _ListDaftarTimState extends State<ListDaftarTim> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: MediaQuery.of(context).size.height * 0.8,
      child: Consumer<TeamViewModel>(
        builder: (context, team, child) {
          if (team.appState == AppState.loading) {
            return _loadingContainer();
          }
          if (team.appState == AppState.loaded) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: team.listOfTeam.length,
              itemBuilder: (context, index) {
                var data = team.listOfTeam[index];
                return CardTeam(teamDetail: data);
              },
            );
          }
          if (team.appState == AppState.noData) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                'Tim masih kosong',
                style: AppFont.textScreenEmpty,
              ),
            );
          }
          if (team.appState == AppState.failure) {
            return Container(
              alignment: Alignment.center,
              child: Text(
                'Gagal mengambil data tim',
                style: AppFont.textScreenEmpty,
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  Widget _loadingContainer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      // padding: const EdgeInsets.all(16),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return ShimmerCardTeam();
        },
      ),
    );
  }
}
