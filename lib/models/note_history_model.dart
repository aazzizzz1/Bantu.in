import 'package:bantuin/models/note_model.dart';

class NoteHistoryModel {
  final OwnerDetailModel owner;
  final List<HistoryDetailModel> history;
  final DateTime noteCreated;
  final DateTime noteDone;
  final String noteStatus;

  NoteHistoryModel({
    required this.owner,
    required this.history,
    required this.noteCreated,
    required this.noteDone,
    required this.noteStatus,
  });

  factory NoteHistoryModel.fromJson(Map<String, dynamic> json) =>
      NoteHistoryModel(
        owner: OwnerDetailModel.fromJson(json['data']['owner']),
        history: json['data']['histories'] != null
            ? (json['data']['histories'] as List)
                .map((e) => HistoryDetailModel.fromJson(e))
                .toList()
            : [],
        noteCreated: DateTime.parse(json['data']['note_created_at']).toLocal(),
        noteDone: DateTime.parse(json['data']['note_done_at']).toLocal(),
        noteStatus: json['data']['note_status'],
      );
}

class HistoryDetailModel {
  final int id;
  final String note;
  final String user;
  final List file;
  final String role;
  final String status;
  final DateTime date;

  HistoryDetailModel({
    required this.id,
    required this.note,
    required this.user,
    required this.file,
    required this.role,
    required this.status,
    required this.date,
  });

  factory HistoryDetailModel.fromJson(Map<String, dynamic> json) =>
      HistoryDetailModel(
        id: json['id'] ?? 0,
        note: json['note'] ?? 'null',
        user: json['user'] ?? 'null',
        file: json['file'] ?? [],
        role: json['role'] ?? 'null',
        status: json['status'] ?? 'null',
        date: DateTime.parse(json['date']),
      );
}

/* {
  "status": 200,
  "data": {
    "owner": {
      "id": 32,
      "username": "Maul",
      "email": "maul@mail.com",
      "phone": "087180641240",
      "job": "Pedagang",
      "photo": "https://res-2.cloudinary.com/dis2k0keq/image/upload/v1683778606/public/profile_picture/9208033f5b.png",
      "notes_count": 0,
      "point": 300
    },
    "histories": [
      {
        "id": 301,
        "note": "TestPersonal1",
        "user": "Rambo Jago",
        "file": [
          "https://res-1.cloudinary.com/dis2k0keq/image/upload/v1685041090/public/files/dc2-1024x683.jpg.jpg"
        ],
        "role": "member",
        "status": "have_upload",
        "date": "2023-05-26 01:58"
      }
    ],
    "note_created_at": "2023-05-26T01:48:29.155+07:00",
    "note_done_at": "2023-05-26T01:48:29.166+07:00",
    "note_status": "in_progress"
  }
} */