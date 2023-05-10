class RingtoneModel {
  final List<RingtoneDetailModel> ringtones;

  RingtoneModel({required this.ringtones});

  factory RingtoneModel.fromJson(Map<String, dynamic> json) => RingtoneModel(
        ringtones: json['data'] != null
            ? (json['data'] as List)
                .map((e) => RingtoneDetailModel.fromJson(e))
                .toList()
            : [],
      );
}

class RingtoneDetailModel {
  final int id;
  final String name;
  final String path;

  RingtoneDetailModel({
    required this.id,
    required this.name,
    required this.path,
  });

  factory RingtoneDetailModel.fromJson(Map<String, dynamic> json) =>
      RingtoneDetailModel(
        id: json['id'],
        name: json['name'],
        path: json['path'],
      );
}
