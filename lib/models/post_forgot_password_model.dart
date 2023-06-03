class PostForgotPasswordModel {
  final String email;

  PostForgotPasswordModel({required this.email});

  Map<String, dynamic> toJson() => {
        'email': email,
      };
}
