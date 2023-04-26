class NoteTimModel {
  final String title;
  final List<NoteTimModelItems> items;

  NoteTimModel({
    required this.title,
    required this.items,
  });
}

class NoteTimModelItems {
  final String titles;
  final String description;
  final String date;
  final String month;
  final String avatarUrl;
  final String name;
  final bool isUploaded;

  NoteTimModelItems({
    required this.titles,
    required this.description,
    required this.date,
    required this.month,
    required this.avatarUrl,
    required this.name,
    required this.isUploaded,
  });

  // factory NoteTimModelItems.fromJson(Map<String, dynamic> json) =>
  //     NoteTimModelItems(
  //       id: json['id'],
  //       subject: json['subject'],
  //       description: json['description'],
  //       eventDate: json['event_date'],
  //       columnId: json['column_id'],
  //       notesType: json['notes_type'],
  //     );
}
