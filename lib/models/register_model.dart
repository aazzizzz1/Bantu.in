import 'dart:convert';

class RegisterModel {
  final String username;
  final String email;
  final String phone;
  final String job;
  final String password;
  final String passwordConfirmation;

  RegisterModel({
    required this.username,
    required this.email,
    required this.phone,
    required this.job,
    required this.password,
    required this.passwordConfirmation,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        username: json['username'],
        email: json['email'],
        phone: json['phone'],
        job: json['job'],
        password: json['password'],
        passwordConfirmation: json['password_confirmation'],
      );

  Map<String, dynamic> toJson() => {
        'username': username,
        'email': email,
        'phone': phone,
        'job': job,
        'password': password,
        'password_confirmation': passwordConfirmation,
      };
}
