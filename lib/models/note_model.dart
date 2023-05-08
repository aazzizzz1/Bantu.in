class NoteModel {
  final int? id;
  final String subject;
  final String description;
  final String eventDate;
  final String? notesType;
  final String? status;
  final List? member;
  final String? reminder;
  final int? ringtoneId;
  final String? ringtone;

  NoteModel({
    this.id,
    required this.subject,
    required this.description,
    required this.eventDate,
    this.notesType,
    this.status,
    this.member,
    this.reminder,
    this.ringtoneId,
    this.ringtone,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        id: json['id'],
        subject: json['subject'],
        description: json['description'],
        eventDate: json['event_date'],
        ringtone: json['ringtone'],
        notesType: json['notes_type'],
        status: json['status'],
        member: json['member'],
      );
  Map<String, dynamic> toJson() => {
        "subject": subject,
        "description": description,
        "event_date": eventDate,
        "reminder": reminder,
        "ringtone_id": ringtoneId,
      };
}
