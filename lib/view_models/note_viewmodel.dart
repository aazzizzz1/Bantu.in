import 'package:bantuin/models/note_model.dart';
import 'package:flutter/material.dart';

class NoteViewModel with ChangeNotifier {
  // this code for get api
  List<NoteModel> _listNoteApi = [];
  List<NoteModel> get listNoteApi => _listNoteApi;

  List<NoteModel> _listNote = [
    NoteModel(
      title: 'Meeting with John Doe',
      description: 'Meeting with John Doe to discuss about the project',
      avatarUrl:
          'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
      name: 'John Doe',
      fileUrl: 'https://example.com/notes.pdf',
      date: '15',
      month: 'Apr',
      eventDate: '2023-04-08',
      reminder: '2023-04-07 10:00:00',
      ringtone: 'default',
      createdBy: 'Aziz',
      progress: 0.6,
      isAdmin: true,
    ),
    NoteModel(
      title: 'Meeting with John Doe',
      description: 'Meeting with John Doe to discuss about the project',
      avatarUrl:
          'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
      name: 'John Doe',
      fileUrl: 'https://example.com/notes.pdf',
      date: '15',
      month: 'Apr',
      eventDate: '2023-04-08',
      reminder: '2023-04-07 10:00:00',
      ringtone: 'default',
      createdBy: 'Aziz',
      isUpload: false,
      isAdmin: false,
    ),
    NoteModel(
      title: 'Meeting with John Doe',
      description: 'Meeting with John Doe to discuss about the project',
      avatarUrl:
          'https://docs.google.com/uc?id=1kB97Winf-__sP5M8sysWMZFwSxKKcD_0',
      name: 'John Doe',
      fileUrl: 'https://example.com/notes.pdf',
      date: '15',
      month: 'Apr',
      eventDate: '2023-04-08',
      reminder: '2023-04-07 10:00:00',
      ringtone: 'default',
      createdBy: 'Aziz',
      isPersonal: true,
    ),
  ];
}
