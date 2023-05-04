import 'package:bantuin/components/card_mynotes_progres.dart';
import 'package:bantuin/components/card_incoming_notes_upload.dart';
import 'package:bantuin/components/card_mynotes_personal.dart';
import 'package:bantuin/screens/tim/tim_card_group.dart';
import 'package:flutter/material.dart';

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
      child: ListView.builder(
        itemCount: 8,
        itemBuilder: (context, index) {
          return Column(
            children: [
              TimCardGroup(
                title: 'Tim Qatros',
                description: 'Deskripsi Tim A',
                date: '12',
                month: 'Jan',
                avatarUrl: 'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
                name: 'Nama Tim A',
                isDone: true,
              ),
            ],
          );
        },
      ),
    );
  }
}
