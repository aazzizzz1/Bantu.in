import 'note_model.dart';

class NoteDetailClientModel {
  final int id;
  final String subject;
  final String description;
  final DateTime eventDate;
  final DateTime reminder;
  final String notesType;
  final String status;
  final OwnerDetailModel owner;
  final String ringtone;
  final List file;
  final List<MemberDetailModel> member;

  NoteDetailClientModel({
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

  factory NoteDetailClientModel.fromJson(Map<String, dynamic> json) =>
      NoteDetailClientModel(
        id: json['data']['id'] ?? 0,
        subject: json['data']['subject'] ?? 'null',
        description: json['data']['description'] ?? 'null',
        eventDate: DateTime.parse(json['data']['event_date']),
        reminder: DateTime.parse(json['data']['reminder']),
        notesType: json['data']['note_type'] ?? [],
        status: json['data']['status'] ?? 'null',
        owner: OwnerDetailModel.fromJson(json['data']['owner'][0]),
        ringtone: json['data']['ringtone'] ?? 'null',
        file: json['data']['file'],
        member: json['data']['member'] != null
            ? (json['data']['member'] as List)
                .map((e) => MemberDetailModel.fromJson(e))
                .toList()
            : [],
      );
}
