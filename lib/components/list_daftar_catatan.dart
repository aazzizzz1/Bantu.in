import 'package:bantuin/components/card_incoming_notes.dart';
import 'package:bantuin/components/card_mynotes.dart';
import 'package:bantuin/components/card_mynotes_personal.dart';
import 'package:flutter/material.dart';

class ListDaftarCatatan extends StatefulWidget {
  const ListDaftarCatatan({super.key});

  @override
  State<ListDaftarCatatan> createState() => _ListDaftarCatatanState();
}

class _ListDaftarCatatanState extends State<ListDaftarCatatan> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 160),
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CardMyNotes(
                title: 'Meeting with client',
                description: 'Discuss bantuin project requirements with client',
                date: '15',
                month: 'Apr',
                avatarUrl:
                    'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
                name: 'John Doe',
                isUploaded: true,
              ),
              CardIncomingNotes(
                title: 'Meeting with client',
                description: 'Discuss bantuin project requirements with client',
                date: '15',
                month: 'Apr',
                avatarUrl:
                    'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
                name: 'John Doe',
                progress: 0.6,
              ),
              CardMyNotes(
                title: 'Meeting with client',
                description: 'Discuss bantuin project requirements with client',
                date: '15',
                month: 'Apr',
                avatarUrl:
                    'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
                name: 'John Doe',
                isUploaded: false,
              ),
              CardMyNotesPersonal(
                title: 'Meeting with client',
                description: 'Discuss bantuin project requirements with client',
                date: '15',
                month: 'Apr',
                avatarUrl:
                    'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
                name: 'John Doe',
              ),
            ],
          );
        },
      ),
    );
  }
}
