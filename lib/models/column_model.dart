class ColumnModelItem {
  final List<ColumnModel> column;

  ColumnModelItem({required this.column});

  factory ColumnModelItem.fromJson(Map<String, dynamic> json) => ColumnModelItem(
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
  final List<String> note;

  ColumnModel({required this.id, required this.title, required this.team, required this.note});

  factory ColumnModel.fromJson(Map<String, dynamic> json) {
    return ColumnModel(
      id: json['id'],
      title: json['title'],
      team: json['team'],
      note: List<String>.from(json['note']),
    );
  }
}

