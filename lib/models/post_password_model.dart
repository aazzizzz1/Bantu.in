class PostPasswordModel {
  final String current_password;
  final String password;
  final String password_confirmation;

  PostPasswordModel({
    required this.current_password,
    required this.password,
    required this.password_confirmation,
  });

  Map<String, dynamic> toJson() => {
        "current_password": current_password,
        "password": password,
        "password_confirmation": password_confirmation,
      };
}