class NoteModel {
  final int id;
  final String subject;
  final String description;
  // final String? date;
  final String eventDate;
  final String notesType;
  final String status;
  final List member;
  // final String reminder;
  // final int ringtoneId;
  // final String ringtone;

  NoteModel({
    required this.id,
    required this.subject,
    required this.description,
    required this.eventDate,
    required this.notesType,
    required this.status,
    required this.member,
    // required this.reminder,
    // required this.ringtoneId,
    // required this.ringtone,
    // this.date,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        id: json['id'],
        subject: json['subject'],
        description: json['description'],
        eventDate: json['event_date'],
        notesType: json['notesType'],
        status: json['status'],
        member: json['member'],
        // reminder: reminder,
        // ringtoneId: ringtoneId,
        // ringtone: ringtone,
      );
  // Map<String, dynamic> toJson() => {
  //       "subject": subject,
  //       "description": description,
  //       "event_date": eventDate,
  //       "reminder": reminder,
  //       "ringtone_id": ringtoneId,
  //     };
}
