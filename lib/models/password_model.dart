class PasswordModel {
  final int id;
  final String current_password;
  final String password;
  final String password_confirmation;

  PasswordModel({
    required this.id,
    required this.current_password,
    required this.password,
    required this.password_confirmation,
  });

  factory PasswordModel.fromJson(Map<String, dynamic> json) {
    return PasswordModel(
      id: json['id'] ?? 0,
      current_password: json['current_password'] ?? 'null',
      password: json['password'] ?? 'null',
      password_confirmation: json['password_confirmation'] ?? 'null',
    );
  }
}