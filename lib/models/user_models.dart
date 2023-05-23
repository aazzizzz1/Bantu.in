// class UsersModel {
//   final List<UsersDetailModel> users;

//   UsersModel({required this.users});

//   factory UsersModel.fromJson(Map<String, dynamic> json) {
//     final List<dynamic> usersList = json['data'] ?? [];
//     List<UsersDetailModel> users = usersList.map((e) => UsersDetailModel.fromJson(e)).toList();
//     return UsersModel(users: users);
//   }
// }

class UsersDetailModel {
  final int id;
  final String username;
  final String email;
  final String phone;
  final String job;
  final Photo photo;

  UsersDetailModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.job,
    required this.photo,
  });

  factory UsersDetailModel.fromJson(Map<String, dynamic> json) {
    return UsersDetailModel(
      id: json['id'],
      username: json['username'],
      email: json['email'],
      phone: json['phone'],
      job: json['job'],
      photo: Photo.fromJson(json['photo']),
    );
  }
}

class Photo {
  final String? url;

  Photo({this.url});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      url: json['url'],
    );
  }
}
