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
      margin: const EdgeInsets.only(top: 170),
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Column(
            children: [
              CardIncomingNotes(
                title: 'Belikan saya tiket pesawat',
                description: 'Belikan saya tiket pesawat untuk tgl 2 april ke Solo dan pulangnya tgl 4 april.',
                date: '1',
                month: 'Mar',
                avatarUrl: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
                name: 'John Doe',
                progress: 0.8,
              ),
              CardMyNotes(
                title: 'Meeting with client',
                description: 'Discuss bantuin project requirements with client',
                date: '16',
                month: 'Nov',
                avatarUrl:'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
                name: 'Zizi',
                isUploaded: false,
              ),
              CardMyNotes(
                title: 'Beli tiket untuk bos',
                description: 'Belikan saya tiket pesawat untuk tgl 2 april ke Solo dan pulangnya tgl 4 april.',
                date: '15',
                month: 'Apr',
                avatarUrl: 'https://images.unsplash.com/photo-1610276198568-eb6d0ff53e48?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1480&q=80',
                name: 'Zahra',
                isUploaded: true,
              ),
              CardMyNotesPersonal(
                title: 'Acara ulang tahun adik',
                description: 'Ulang tahun tanggal 17 adik fitri',
                date: '5',
                month: 'Jan',
                avatarUrl:'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
                name: 'Siapa ya',
              ),
            ],
          );
        },
      ),
    );
  }
}
