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
  final String photo;

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
      id: json['id'] ?? 0,
      username: json['username'] ?? 'null',
      email: json['email'] ?? 'null',
      phone: json['phone'] ?? 'null',
      job: json['job'] ?? 'null',
      photo: json['photo'] ?? 'https://www.pngitem.com/pimgs/m/146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png',
    );
  }
}

