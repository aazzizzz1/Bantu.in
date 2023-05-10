class PostNoteModel {
  final String subject;
  final String description;
  final String eventDate;
  final String reminder;
  final int ringtoneId;

  PostNoteModel({
    required this.subject,
    required this.description,
    required this.eventDate,
    required this.reminder,
    required this.ringtoneId,
  });

  Map<String, dynamic> toJson() => {
        "subject": subject,
        "description": description,
        "event_date": eventDate,
        "reminder": reminder,
        "ringtone_id": ringtoneId,
      };
}
