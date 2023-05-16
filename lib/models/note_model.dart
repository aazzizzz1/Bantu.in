class NoteModel {
  final List<NoteDetailModel> notes;

  NoteModel({required this.notes});

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        notes: json['data'] != null
            ? (json['data'] as List)
                .map((e) => NoteDetailModel.fromJson(e))
                .toList()
            : [],
      );
}

class NoteDetailModel {
  final int id;
  final String subject;
  final String description;
  final DateTime eventDate;
  final DateTime reminder;
  final String notesType;
  final String status;
  final List owner;
  final String ringtone;
  final List member;

  NoteDetailModel({
    required this.id,
    required this.subject,
    required this.description,
    required this.eventDate,
    required this.reminder,
    required this.notesType,
    required this.status,
    required this.owner,
    required this.ringtone,
    required this.member,
  });

  factory NoteDetailModel.fromJson(Map<String, dynamic> json) =>
      NoteDetailModel(
        id: json['id'] ?? 0,
        subject: json['subject'] ?? '',
        description: json['description'] ?? '',
        eventDate: DateTime.parse(json['event_date']) ?? DateTime.now(),
        reminder: DateTime.parse(json['reminder']) ?? DateTime.now(),
        notesType: json['note_type'] ?? '',
        status: json['status'] ?? '',
        owner: json['owner'] != null
            ? (json['owner'] as List)
                .map((e) => OwnerDetailModel.fromJson(e))
                .toList()
            : [],
        ringtone: json['ringtone'] ?? '',
        member: json['member'] ?? [],
      );

  /*"id": 39,
                    "username": "Putra",
                    "email": "putradaus10@gmail.com",
                    "phone": "081252222530",
                    "job": "Mahasiswa",
                    "photo": null
      */
}

class OwnerDetailModel {
  final int id;
  final String username;
  final String email;
  final String phone;
  final String job;
  final String photo;

  OwnerDetailModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.job,
    required this.photo,
  });

  factory OwnerDetailModel.fromJson(Map<String, dynamic> json) =>
      OwnerDetailModel(
        id: json['id'] ?? 0,
        username: json['username'] ?? '',
        email: json['email'] ?? '',
        phone: json['phone'] ?? '',
        job: json['job'] ?? '',
        photo: json['photo'] ?? '',
      );
}
