class PostNoteModel {
  final String subject;
  final String description;
  final String eventDate;
  final String reminder;
  final List? file;
  final int ringtoneId;
  final List? email;

  PostNoteModel({
    required this.subject,
    required this.description,
    required this.eventDate,
    required this.reminder,
    required this.ringtoneId,
    this.email,
    this.file,
  });

  Map<String, dynamic> toJson() => {
        "subject": subject,
        "description": description,
        "event_date": eventDate,
        "reminder": reminder,
        "ringtone_id": ringtoneId,
        "email": email,
        "file": file,
      };
}
