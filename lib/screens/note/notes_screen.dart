import 'package:bantuin/components/card_mynotes_progres.dart';
import 'package:bantuin/components/card_incoming_notes_upload.dart';
import 'package:bantuin/components/card_mynotes_personal.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
import 'package:bantuin/widgets/detail_note/admin_member.dart';
import 'package:bantuin/widgets/floating_button/floating_notes.dart';
import 'package:bantuin/constants/button/app_button.dart';
import 'package:bantuin/screens/note/notes_form.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'note_form2.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    Future.microtask(() =>
        Provider.of<NoteViewModel>(context, listen: false).getPersonalNote());
    Future.microtask(() =>
        Provider.of<NoteViewModel>(context, listen: false).getCompleteNote());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 2,
        title: Text(
          'Catatan',
          style: AppFont.regular20,
        ),
        bottom: TabBar(
          automaticIndicatorColorAdjustment: false,
          dividerColor: Colors.green,
          indicatorColor: AppColorPrimary.primary6,
          labelColor: AppColorPrimary.primary6,
          labelStyle: AppFont.semiBold14,
          labelPadding: const EdgeInsets.only(bottom: 15),
          unselectedLabelColor: AppColorNeutral.neutral7,
          controller: tabController,
          tabs: [
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              child: Text(
                "Berjalan",
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              alignment: Alignment.center,
              child: Text(
                "Berlalu",
              ),
            ),
          ],
        ),
      ),
      body: Consumer<NoteViewModel>(
        builder: (context, note, child) {
          return TabBarView(
            controller: tabController,
            children: [
              Stack(
                children: [
                  // content of the page
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(16.0),
                    child: note.listOfPersonalNote.isEmpty
                        ? Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Catatan masih kosong',
                              style: AppFont.regular28,
                            ),
                          )
                        : ListView.builder(
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
                                  return CardIncomingNotesUpload(
                                      noteDetail: data);
                              }
                              // if (data.notesType == 'collaboration') {
                              //   switch (data.notesType) {
                              //     case "personal":
                              //       return CardMyNotesPersonal(
                              //           noteDetail: data);
                              //     case 'collaboration':
                              //       return CardMyNotesProgres(noteDetail: data);
                              //     default:
                              //       return CardIncomingNotesUpload(
                              //           noteDetail: data);
                              //   }
                              // } else {
                              //   CardMyNotesPersonal(noteDetail: data);
                              // }
                            },
                          ),
                  ),
                  Center(),
                  // floating button above bottom navbar
                  Positioned(
                    bottom: 20,
                    right: 16.0,
                    child: FloatingButtonNotes(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NoteForm2()),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: note.listOfCompleteNote.isEmpty
                    ? Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Belum ada catatan',
                          style: AppFont.textScreenEmpty,
                        ),
                      )
                    : ListView.builder(
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
                              return CardIncomingNotesUpload(noteDetail: data);
                          }
                          // switch (convertType) {
                          //   case 1:
                          //     return CardMyNotesProgres(noteDetail: data);
                          //   case 2:
                          //     return CardMyNotesPersonal(noteDetail: data);
                          //   default:
                          //   // return CardMyNotesPersonal(noteDetail: data);
                          // }
                        },
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
