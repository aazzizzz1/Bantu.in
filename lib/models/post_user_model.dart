import 'dart:io';
import 'package:http/http.dart' as http;
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
//   final String photo;

//   Photo({
//     required this.photo,
//   });

//   Map<String, dynamic> toJson() => {
//         "photo": photo,
//       };
// }

class Photo {
  final File photo;

  Photo({
    required this.photo,
  });

  Future<void> upload(int id) async {
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse('https://bantuin.fly.dev/api/users/$id'),
    );

    var fileStream = http.ByteStream(Stream.castFrom(photo.openRead()));
    var fileLength = await photo.length();
    var multipartFile = http.MultipartFile(
      'photo',
      fileStream,
      fileLength,
      filename: photo.path.split('/').last,
    );
    request.files.add(multipartFile);

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('Image upload failed');
    }
  }

  Map<String, dynamic> toJson() => {
        "photo": photo.path,
      };
}


// class Photo {
//   final String? url;

//   Photo({this.url});

//   factory Photo.fromJson(Map<String, dynamic> json) {
//     return Photo(
//       url: json['url'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       "url": url,
//     };
//   }
// }