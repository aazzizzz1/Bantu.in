class NoteModel {
  final int id;
  final String subject;
  final String description;
  final String eventDate;
  final String reminder;
  final int ringtoneId;
  final String notesType;

  NoteModel({
    required this.id,
    required this.subject,
    required this.description,
    required this.eventDate,
    required this.reminder,
    required this.ringtoneId,
    required this.notesType,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        id: json['id'],
        subject: json['subject'],
        description: json['description'],
        eventDate: json['event_date'],
        reminder: json['reminder'],
        ringtoneId: json['column_id'],
        notesType: json['notes_type'],
      );
  Map<String, dynamic> toJson() => {
        "subject": subject,
        "description": description,
        "event_date": eventDate,
        "reminder": reminder,
        "ringtone_id": ringtoneId,
      };
}
