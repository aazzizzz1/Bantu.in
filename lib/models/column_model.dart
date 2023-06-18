class ColumnModelItem {
  final List<ColumnModel> column;

  ColumnModelItem({required this.column});

  factory ColumnModelItem.fromJson(Map<String, dynamic> json) =>
      ColumnModelItem(
        column: json['data'] != null
            ? (json['data'] as List)
                .map((e) => ColumnModel.fromJson(e))
                .toList()
            : [],
      );
}

class ColumnModel {
  final int id;
  final String title;
  final String team;
  final List<CardColumnDetailModel> note;

  ColumnModel(
      {required this.id,
      required this.title,
      required this.team,
      required this.note});

  factory ColumnModel.fromJson(Map<String, dynamic> json) {
    return ColumnModel(
      id: json['id'],
      title: json['title'],
      team: json['team'],
      note: json['card'] != null
          ? (json['card'] as List)
              .map((e) => CardColumnDetailModel.fromJson(e))
              .toList()
          : [],
    );
  }
}

class CardColumnDetailModel {
  final int id;
  final String subject;
  final String description;
  final String label;

  CardColumnDetailModel({
    required this.id,
    required this.subject,
    required this.description,
    required this.label,
  });

  factory CardColumnDetailModel.fromJson(Map<String, dynamic> json) {
    return CardColumnDetailModel(
      id: json['id'] ?? 0,
      subject: json['subject'] ?? 'null',
      description: json['description'] ?? 'null',
      label: json['label'] ?? 'null',
    );
  }
}

/*"id": 5,
        "subject": "Mmebuat Card",
        "description": "Test Membuat Card",
        "label": null */
