import 'package:bantuin/models/note_model.dart';
import 'package:bantuin/models/user_models.dart';

class TeamModel {
  final List<TeamDetailModel> team;

  TeamModel({required this.team});

  factory TeamModel.fromJson(Map<String, dynamic> json) => TeamModel(
        team: json['data'] != null
            ? (json['data'] as List)
                .map((e) => TeamDetailModel.fromJson(e))
                .toList()
            : [],
      );
}

class TeamDetailModel {
  final int id;
  final String title;
  final String photo;
  final List<OwnerDetailModel> owner;
  final List<UsersDetailModel> participant;

  TeamDetailModel({
    required this.id,
    required this.title,
    required this.owner,
    required this.photo,
    required this.participant,
  });

  factory TeamDetailModel.fromJson(Map<String, dynamic> json) =>
      TeamDetailModel(
        id: json['id'] ?? 0,
        title: json['title'] ?? 'null',
        owner: json['owner'] != null
            ? (json['owner'] as List)
                .map((e) => OwnerDetailModel.fromJson(e))
                .toList()
            : [],
        photo: json['photo'] ?? 'null',
        participant: json['participant'] != null
            ? (json['participant'] as List)
                .map((e) => UsersDetailModel.fromJson(e))
                .toList()
            : [],
      );
}
