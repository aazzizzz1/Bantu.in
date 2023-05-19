import 'package:bantuin/components/card_mynotes_progres.dart';
import 'package:bantuin/components/card_incoming_notes_upload.dart';
import 'package:bantuin/components/card_mynotes_personal.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import '../constants/constant.dart';

class ListDaftarCatatan extends StatefulWidget {
  const ListDaftarCatatan({super.key});

  @override
  State<ListDaftarCatatan> createState() => _ListDaftarCatatanState();
}

class _ListDaftarCatatanState extends State<ListDaftarCatatan> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NoteViewModel>(builder: (context, note, child) {
      return note.listOfPersonalNote.isEmpty
          ? Container(
              alignment: Alignment.center,
              child: Text(
                'Belum ada catatan',
                style: AppFont.textScreenEmpty,
              ),
            )
          : Container(
              padding: const EdgeInsets.all(16),
              height: MediaQuery.of(context).size.height * 0.8,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: note.listOfPersonalNote.length,
                itemBuilder: (context, index) {
                  var data = note.listOfPersonalNote[index];
                  initializeDateFormatting('id_ID', null);
                  switch (data.notesType) {
                    case "personal":
                      return CardMyNotesPersonal(noteDetail: data);
                    case 'collaboration':
                      return CardMyNotesProgres(noteDetail: data);
                    default:
                      return CardMyNotesProgres(noteDetail: data);
                  }
                },
              ),
            );
    });
  }
}
