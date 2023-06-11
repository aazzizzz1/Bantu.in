class InvitationModel {
  final List<InvitationDetailModel> invitation;
  InvitationModel({required this.invitation});

  factory InvitationModel.fromJson(Map<String, dynamic> json) =>
      InvitationModel(
        invitation: json['data'] != null
            ? (json['data'] as List)
                .map((e) => InvitationDetailModel.fromJson(e))
                .toList()
            : [],
      );
}

class InvitationDetailModel {
  final int id;
  final String from;
  final String message;
  final String note;
  final String photo;
  final String dateInvite;
  final List<ActionModel> actions;

  InvitationDetailModel({
    required this.id,
    required this.from,
    required this.message,
    required this.note,
    required this.photo,
    required this.dateInvite,
    required this.actions,
  });

  factory InvitationDetailModel.fromJson(Map<String, dynamic> json) =>
      InvitationDetailModel(
        id: json['id'] ?? 0,
        from: json['from'] ?? 'null',
        message: json['message'] ?? 'null',
        note: json['note'] ?? 'null',
        photo: json['photo'] ?? 'null',
        dateInvite: json['date_invite'] ?? 'null',
        actions: json['actions'] != null
            ? (json['actions'] as List)
                .map((e) => ActionModel.fromJson(e))
                .toList()
            : [],
      );
}

class ActionModel {
  final String action;
  final String url;

  ActionModel({required this.action, required this.url});

  factory ActionModel.fromJson(Map<String, dynamic> json) =>
      ActionModel(action: json['action'], url: json['url']);
}

/* "id": 375,
            "from": "Abdul aziz",
            "message": "mengirim anda sebuah catatan",
            "note": "test colab naqy",
            "actions": [
                {
                    "action": "accept",
                    "url": "https://bantuin.fly.dev/api/note/inv/accept_invitation/94b6ea2b4d188f3c809ff79686cf8fad59183207"
                },
                {
                    "action": "reject",
                    "url": "https://bantuin.fly.dev/api/note/inv/decline_invitation/94b6ea2b4d188f3c809ff79686cf8fad59183207"
                }
            ] */