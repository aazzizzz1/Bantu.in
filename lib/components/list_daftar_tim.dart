import 'package:bantuin/components/card_mynotes_progres.dart';
import 'package:bantuin/components/card_incoming_notes_upload.dart';
import 'package:bantuin/components/card_mynotes_personal.dart';
import 'package:bantuin/screens/tim/tim_card_group.dart';
import 'package:bantuin/view_models/tim_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/constant.dart';

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
        builder: (context, value, child) {
          return value.listOfTeam.isEmpty
              ? Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Tim masih kosong',
                    style: AppFont.textScreenEmpty,
                  ),
                )
              : ListView.builder(
                  reverse: true,
                  itemCount: value.listOfTeam.length,
                  itemBuilder: (context, index) {
                    var data = value.listOfTeam[index];
                    return TimCardGroup(teamDetail: data);
                  },
                );
        },
      ),
    );
  }
}
