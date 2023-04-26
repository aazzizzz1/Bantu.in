import 'package:bantuin/models/user_note_model.dart';
import 'package:flutter/material.dart';

import '../models/note_tim_model.dart';

// class NoteViewModel with ChangeNotifier {
//   // this code for get api
//   List<UserNotesModel> _listNoteApi = [];
//   List<UserNotesModel> get listNoteApi => _listNoteApi;

//   // List<UserNotesModel> _listNoteTim = [];

//   // final List<UserNotesModel> _listNoteTim = [
//   //   UserNotesModel(
//   //     id: 1,
//   //     userId: 1,
//   //     noteId: 1,
//   //     role: 'admin',
//   //     reminder: 'ayaya',
//   //     status: 'done',
//   //     ringtoneId: 1,
//   //   ),
//   //   UserNotesModel(
//   //     id: 2,
//   //     userId: 2,
//   //     noteId: 2,
//   //     role: 'admin',
//   //     reminder: 'ayaya',
//   //     status: 'done',
//   //     ringtoneId: 1,
//   //   ),
//   //   UserNotesModel(
//   //     id: 3,
//   //     userId: 3,
//   //     noteId: 3,
//   //     role: 'admin',
//   //     reminder: 'ayaya',
//   //     status: 'done',
//   //     ringtoneId: 1,
//   //   ),
//   //   UserNotesModel(
//   //     id: 4,
//   //     userId: 4,
//   //     noteId: 4,
//   //     role: 'admin',
//   //     reminder: 'ayaya',
//   //     status: 'done',
//   //     ringtoneId: 1,
//   //   ),
//   // ];
// }

List<NoteTimModel> listNoteTim = [
  NoteTimModel(
    title: "Admin",
    items: [
      NoteTimModelItems(
        titles: 'Meeting with client',
        description: 'Discuss bantuin project requirements with client',
        date: '16',
        month: 'Nov',
        avatarUrl:
            'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
        name: 'Zizi',
        isUploaded: false,
      ),
      NoteTimModelItems(
        titles: 'Meeting with client',
        description: 'Discuss bantuin project requirements with client',
        date: '16',
        month: 'Nov',
        avatarUrl:
            'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
        name: 'Zizi',
        isUploaded: false,
      ),
      NoteTimModelItems(
        titles: 'Meeting with client',
        description: 'Discuss bantuin project requirements with client',
        date: '16',
        month: 'Nov',
        avatarUrl:
            'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
        name: 'Zizi',
        isUploaded: false,
      ),
    ],
  ),
  NoteTimModel(
    title: "Supervisor",
    items: [
      NoteTimModelItems(
        titles: 'Meeting with client',
        description: 'Discuss bantuin project requirements with client',
        date: '16',
        month: 'Nov',
        avatarUrl:
            'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
        name: 'Zizi',
        isUploaded: false,
      ),
      NoteTimModelItems(
        titles: 'Meeting with client',
        description: 'Discuss bantuin project requirements with client',
        date: '16',
        month: 'Nov',
        avatarUrl:
            'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
        name: 'Zizi',
        isUploaded: false,
      ),
      NoteTimModelItems(
        titles: 'Meeting with client',
        description: 'Discuss bantuin project requirements with client',
        date: '16',
        month: 'Nov',
        avatarUrl:
            'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
        name: 'Zizi',
        isUploaded: false,
      ),
    ],
  ),
];
