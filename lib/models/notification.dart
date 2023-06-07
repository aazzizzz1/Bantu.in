class NotificationModel {
  final List<DetailNotificationModel> notif;

  NotificationModel({required this.notif});

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        notif: json['data'] != null
            ? (json['data'] as List)
                .map((e) => DetailNotificationModel.fromJson(e))
                .toList()
            : [],
      );
}

class DetailNotificationModel {
  final String title;
  final String body;
  final String recipient;
  final bool read;
  final String sender;
  final String senderPlace;

  DetailNotificationModel({
    required this.title,
    required this.body,
    required this.recipient,
    required this.read,
    required this.sender,
    required this.senderPlace,
  });

  factory DetailNotificationModel.fromJson(Map<String, dynamic> json) =>
      DetailNotificationModel(
        title: json['title'] ?? 'null',
        body: json['body'] ?? 'null',
        recipient: json['recipient'] ?? 'null',
        read: json['read'] ?? false,
        sender: json['sender'] ?? 'null',
        senderPlace: json['sender_place'] ?? 'null',
      );
}
