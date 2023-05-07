import 'package:bantuin/components/card_mynotes_progres.dart';
import 'package:bantuin/components/card_incoming_notes_upload.dart';
import 'package:bantuin/components/card_mynotes_personal.dart';
import 'package:bantuin/widgets/floating_button/floating_notes.dart';
import 'package:bantuin/constants/button/app_button.dart';
import 'package:bantuin/screens/note/notes_form.dart';
import 'package:flutter/material.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Catatan',
          style: AppFont.semiBold20,
        ),
        centerTitle: true,
        bottom: TabBar(
          automaticIndicatorColorAdjustment: false,
          dividerColor: Colors.green,
          indicatorColor: AppColorPrimary.primary6,
          labelColor: AppColorPrimary.primary6,
          labelStyle: AppFont.semiBold14,
          labelPadding: const EdgeInsets.only(bottom: 15),
          unselectedLabelColor: AppColorNeutral.neutral7,
          controller: tabController,
          tabs: const [
            Text(
              "Berjalan",
            ),
            Text(
              "Berlalu",
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Stack(
            children: [
              // content of the page
              Container(
                padding: const EdgeInsets.all(16.0),
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        CardMyNotesProgres(
                          title: 'Belikan saya tiket pesawat',
                          description:
                              'Belikan saya tiket pesawat untuk tgl 2 april ke Solo dan pulangnya tgl 4 april.',
                          date: '1',
                          month: 'Mar',
                          avatarUrl:
                              'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                          name: 'John Doe',
                          progress: 0.8,
                        ),
                        CardMyNotesPersonal(
                          title: 'Acara ulang tahun adik',
                          description: 'Ulang tahun tanggal 17 adik fitri',
                          date: '5',
                          month: 'Jan',
                          avatarUrl:
                              'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
                          name: 'Siapa ya',
                          isDone: true,
                        ),
                        CardMyNotesProgres(
                          title: 'Meeting with client',
                          description:
                              'Discuss bantuin project requirements with client',
                          date: '15',
                          month: 'Apr',
                          avatarUrl:
                              'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
                          name: 'John Doe',
                          progress: 0.6,
                        ),
                        CardMyNotesPersonal(
                          title: 'Meeting with client',
                          description:
                              'Discuss bantuin project requirements with client',
                          date: '15',
                          month: 'Apr',
                          avatarUrl:
                              'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
                          name: 'John Doe',
                          isDone: false,
                        ),
                      ],
                    );
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
                          builder: (context) => const NotesForm()),
                    );
                  },
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    CardIncomingNotesUpload(
                      title: 'Beli tiket untuk bos',
                      description:
                          'Belikan saya tiket pesawat untuk tgl 2 april ke Solo dan pulangnya tgl 4 april.',
                      date: '15',
                      month: 'Apr',
                      avatarUrl:
                          'https://images.unsplash.com/photo-1610276198568-eb6d0ff53e48?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80',
                      name: 'Zahra',
                      isUploaded: true,
                    ),
                    CardIncomingNotesUpload(
                      title: 'Meeting with client',
                      description:
                          'Discuss bantuin project requirements with client',
                      date: '15',
                      month: 'Apr',
                      avatarUrl:
                          'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
                      name: 'John Doe',
                      isUploaded: true,
                    ),
                    CardIncomingNotesUpload(
                      title: 'Meeting with client',
                      description:
                          'Discuss bantuin project requirements with client',
                      date: '15',
                      month: 'Apr',
                      avatarUrl:
                          'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
                      name: 'John Doe',
                      isUploaded: false,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
