class NoteModel {
  final int id;
  final String subject;
  final String description;
  final String eventDate;
  final int columnId;
  final String notesType;

  NoteModel({
    required this.id,
    required this.subject,
    required this.description,
    required this.eventDate,
    required this.columnId,
    required this.notesType,
  });

  factory NoteModel.fromJson(Map<String, dynamic> json) => NoteModel(
        id: json['id'],
        subject: json['subject'],
        description: json['description'],
        eventDate: json['event_date'],
        columnId: json['column_id'],
        notesType: json['notes_type'],
      );
}
