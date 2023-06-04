import 'dart:async';

import 'package:alarm/alarm.dart';
import 'package:bantuin/components/bottom_sheet_filter.dart';
import 'package:bantuin/components/card_mynotes_progres.dart';
import 'package:bantuin/components/card_incoming_notes_upload.dart';
import 'package:bantuin/components/card_mynotes_personal.dart';
import 'package:bantuin/view_models/note_viewmodel.dart';
import 'package:bantuin/widgets/detail_note/admin_member.dart';
import 'package:bantuin/widgets/floating_button/floating_notes.dart';
import 'package:bantuin/constants/button/app_button.dart';
import 'package:bantuin/screens/note/notes_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../components/btn_filter_passed.dart';
import '../../components/btn_filter_upcoming.dart';
import '../../utils/app_state.dart';
import '../../widgets/shimmer_loading/shimmer_card_widget.dart';
import '../reminder/ring.dart';
import 'note_form2.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> with TickerProviderStateMixin {
  late TabController tabController;
  static StreamSubscription? subscription;
  String name = '';

  void getOwner() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('username').toString();
  }

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 2, vsync: this);
    Future.microtask(() => Provider.of<NoteViewModel>(context, listen: false)
        .filterUpcomingNote());
    Future.microtask(() =>
        Provider.of<NoteViewModel>(context, listen: false).filterPassedNote());
    subscription ??= Alarm.ringStream.stream.listen(
      (alarmSettings) => navigateToRingScreen(alarmSettings),
    );

    getOwner();
    super.initState();
  }

  Future<void> navigateToRingScreen(AlarmSettings alarmSettings) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ExampleAlarmRingScreen(alarmSettings: alarmSettings),
        ));
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
      body: TabBarView(
        controller: tabController,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const BtnFilterUpcoming(),
                    const SizedBox(height: 8.0),
                    Consumer<NoteViewModel>(
                      builder: (context, note, child) {
                        if (note.appState == AppState.loading) {
                          return _loadingContainer();
                        }
                        if (note.appState == AppState.loaded) {
                          return SizedBox(
                            height: MediaQuery.of(context).size.height * 0.65,
                            child: ListView.builder(
                              itemCount: note.listOfUpcomingNote.length,
                              itemBuilder: (context, index) {
                                var data = note.listOfUpcomingNote[index];
                                initializeDateFormatting('id_ID', null);
                                bool isOwner = false;
                                if (name == data.owner.first.username) {
                                  isOwner = true;
                                }
                                if (data.notesType == 'collaboration') {
                                  if (isOwner) {
                                    return CardMyNotesProgres(noteDetail: data);
                                  } else {
                                    return CardIncomingNotesUpload(
                                        noteDetail: data);
                                  }
                                } else {
                                  return CardMyNotesPersonal(noteDetail: data);
                                }
                              },
                            ),
                          );
                        }
                        if (note.appState == AppState.noData) {
                          return Stack(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                alignment: Alignment.center,
                                child: Text(
                                  'Catatan masih kosong',
                                  style: AppFont.textScreenEmpty,
                                ),
                              ),
                            ],
                          );
                        }

                        if (note.appState == AppState.failure) {
                          return Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Gagal mengambil catatan',
                              style: AppFont.textScreenEmpty,
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ],
                ),
              ),
              //Consumer

              //FAB
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

          //PASSED NOTE
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const BtnFilterPassed(),
                const SizedBox(height: 8.0),
                //Consumer
                Consumer<NoteViewModel>(
                  builder: (context, note, child) {
                    if (note.appState == AppState.loading) {
                      return _loadingContainer();
                    }
                    if (note.appState == AppState.loaded &&
                        note.listOfPassedNote.isNotEmpty) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: ListView.builder(
                          itemCount: note.listOfPassedNote.length,
                          itemBuilder: (context, index) {
                            var data = note.listOfPassedNote[index];
                            initializeDateFormatting('id_ID', null);
                            bool isOwner = false;
                            if (name == data.owner.first.username) {
                              isOwner = true;
                            }
                            if (data.notesType == 'collaboration') {
                              if (isOwner) {
                                return CardMyNotesProgres(noteDetail: data);
                              } else {
                                return CardIncomingNotesUpload(
                                    noteDetail: data);
                              }
                            } else {
                              return CardMyNotesPersonal(noteDetail: data);
                            }
                          },
                        ),
                      );
                    }
                    if (note.appState == AppState.noData ||
                        note.listOfPassedNote.isEmpty) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        alignment: Alignment.center,
                        child: Text(
                          'Catatan masih kosong',
                          style: AppFont.textScreenEmpty,
                        ),
                      );
                    }

                    if (note.appState == AppState.failure) {
                      return Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Gagal mengambil catatan',
                          style: AppFont.textScreenEmpty,
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _loadingContainer() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.65,
      // padding: const EdgeInsets.all(16),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 6,
        itemBuilder: (context, index) {
          return ShimmerCardWidget();
        },
      ),
    );
  }
}
