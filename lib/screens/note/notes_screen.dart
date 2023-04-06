import 'package:bantuin/components/card_incoming_notes.dart';
import 'package:bantuin/components/floating_notes.dart';
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
              "Catatanku",
            ),
            Text(
              "Catatan Masuk",
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return CardIncomingNotes(
                      title: 'Meeting with client',
                      description:
                          'Discuss bantuin project requirements with client',
                      date: '15',
                      month: 'Apr',
                      avatarUrl:
                          'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
                      name: 'John Doe',
                      progress: 0.6,
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
              itemCount: 10,
              itemBuilder: (context, index) {
                return CardIncomingNotes(
                  title: 'Meeting with client',
                  description:
                      'Discuss bantuin project requirements with client',
                  date: '15',
                  month: 'Apr',
                  avatarUrl:
                      'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
                  name: 'John Doe',
                  progress: 0.6,
                );
              },
            ),
          ),
        ],
      ),
      // body: TabBarView(
      //   children: [
      //     Stack(
      //       children: [
      //         // content of the page

      //         Center(
      //           child: Text('Hello World'),
      //         ),
      //         // floating button above bottom navbar
      //         Positioned(
      //           bottom: 20,
      //           right: 16.0,
      //           child: FloatingButtonNotes(
      //             onPressed: () {
      //               Navigator.push(
      //                 context,
      //                 MaterialPageRoute(
      //                     builder: (context) => const NotesForm()),
      //               );
      //             },
      //           ),
      //         ),
      //       ],
      //     ),
      //     Container(
      //       child: Text("Catatan Masuk"),
      //     ),
      //   ],
      // ),
    );
  }
}
