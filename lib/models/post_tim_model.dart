class PostTimModel {
  final String title;
  final List<String> email;

  PostTimModel({required this.title, required this.email});

  Map<String, dynamic> toJson() => {
        'title': title,
        'email': email,
      };
}
