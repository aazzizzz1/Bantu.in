class PostUsersModel {
  final String username;
  final String email;
  final String phone;
  final String job;
  // final Photo photo;

  PostUsersModel({
    required this.username,
    required this.email,
    required this.phone,
    required this.job,
    // required this.photo,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "phone": phone,
        "job": job,
        // "photo": photo,
      };
}
// class Photo {
//   String url;

//   Photo({required this.url});

//   factory Photo.fromJson(Map<String, dynamic> json) {
//     return Photo(
//       url: json['url'],
//     );
//   }
// }
