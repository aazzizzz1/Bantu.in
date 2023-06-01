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
  final List status;
  final List<OwnerDetailModel> owner;
  final String ringtone;
  final List file;
  final List<MemberDetailModel> member;

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
    required this.file,
    required this.member,
  });

  factory NoteDetailModel.fromJson(Map<String, dynamic> json) =>
      NoteDetailModel(
        id: json['id'] ?? 0,
        subject: json['subject'] ?? 'null',
        description: json['description'] ?? 'null',
        eventDate: DateTime.parse(json['event_date']),
        reminder: DateTime.parse(json['reminder']),
        notesType: json['note_type'] ?? 'null',
        status: json['status'] ?? [],
        owner: json['owner'] != null
            ? (json['owner'] as List)
                .map((e) => OwnerDetailModel.fromJson(e))
                .toList()
            : [],
        ringtone: json['ringtone'] ?? 'null',
        file: json['file'] ?? [],
        member: json['member'] != null
            ? (json['member'] as List)
                .map((e) => MemberDetailModel.fromJson(e))
                .toList()
            : [],
      );
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
        username: json['username'] ?? 'null',
        email: json['email'] ?? 'null',
        phone: json['phone'] ?? 'null',
        job: json['job'] ?? 'null',
        photo: json['photo'] ?? 'null',
      );
}

class MemberDetailModel {
  final int id;
  final String username;
  final String email;
  final String phone;
  final String job;
  final String photo;

  MemberDetailModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.job,
    required this.photo,
  });

  factory MemberDetailModel.fromJson(Map<String, dynamic> json) =>
      MemberDetailModel(
        id: json['id'] ?? 0,
        username: json['username'] ?? 'null',
        email: json['email'] ?? 'null',
        phone: json['phone'] ?? 'null',
        job: json['job'] ?? 'null',
        photo: json['photo'] ?? 'null',
      );
}

/* "id": 417,
        "subject": "tes kolab bersama",
        "description": "tes colab",
        "owner": [
            {
                "id": 48,
                "username": "Abdul aziz",
                "email": "azizvbi33@gmail.com",
                "phone": "082237808721",
                "job": "mobile developer",
                "photo": null
            }
        ],
        "member": [
            {
                "id": 39,
                "username": "Putra",
                "email": "putradaus10@gmail.com",
                "phone": "081252222530",
                "job": "Mahasiswa",
                "photo": "https://res-3.cloudinary.com/dis2k0keq/image/upload/v1685022683/public/profile_picture/131defa052.png"
            },
            {
                "id": 102,
                "username": "Penghuni kos",
                "email": "kosproblem2@gmail.com",
                "phone": "0811111176",
                "job": "Penjaga kos",
                "photo": null
            }
        ],
        "event_date": "2023-06-01 12:00",
        "reminder": "2023-05-30 06:19",
        "ringtone_id": 2,
        "ringtone": "Destiny",
        "file": [
            "https://res-5.cloudinary.com/dis2k0keq/image/upload/v1685015281/public/files/IMG-20230517-WA0007.jpg.jpg"
        ],
        "note_type": "collaboration",
        "status": "in_progress",
        "column": null
*/