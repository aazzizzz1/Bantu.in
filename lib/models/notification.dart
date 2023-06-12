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
  final String photo;
  final int senderPlace;
  final DateTime created;
  final String send;
  final String placeName;
  final String notifType;

  DetailNotificationModel({
    required this.title,
    required this.body,
    required this.recipient,
    required this.read,
    required this.sender,
    required this.photo,
    required this.senderPlace,
    required this.created,
    required this.send,
    required this.placeName,
    required this.notifType,
  });

  factory DetailNotificationModel.fromJson(Map<String, dynamic> json) =>
      DetailNotificationModel(
        title: json['title'] ?? 'null',
        body: json['body'] ?? 'default',
        recipient: json['recipient'] ?? 'null',
        read: json['read'] ?? false,
        sender: json['sender'] ?? 'null',
        photo: json['photo'] ??
            'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
        senderPlace: json['sender_place'] ??
            null, // Ubah menjadi 0 sebagai nilai default
        created: DateTime.parse(json['created'] ?? 'null'),
        send: json['send'] ?? 'null',
        placeName: json['place_name'] ?? 'null',
        notifType: json['notif_type'] ?? 'null',
      );
}
//
