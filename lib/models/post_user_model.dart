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
    // Create a multipart request
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://bantuin.fly.dev/api/users/$id'), // Replace with your upload URL
    );

    // Attach the file to the request
    var fileStream = http.ByteStream(Stream.castFrom(photo.openRead()));
    var fileLength = await photo.length();
    var multipartFile = http.MultipartFile(
      'photo',
      fileStream,
      fileLength,
      filename: photo.path.split('/').last,
    );
    request.files.add(multipartFile);

    // Send the request
    var response = await request.send();

    // Check the response status
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