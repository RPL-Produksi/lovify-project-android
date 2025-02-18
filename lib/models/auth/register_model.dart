import 'dart:convert';

import 'package:dio/dio.dart';

class RegisterModel {
  final MultipartFile? avatar;
  final String fullname;
  final String username;
  final String password;
  final String passwordConfirmation;
  final String email;
  final String phoneNumber;
  final String role = 'client';

  RegisterModel({
    this.avatar,
    required this.fullname,
    required this.username,
    required this.password,
    required this.passwordConfirmation,
    required this.email,
    required this.phoneNumber,
  });


  Map<String, dynamic> toMap() {
    return {
      if (avatar != null) 'avatar': avatar,
      'fullname': fullname,
      'username': username,
      'password': password,
      'password_confirmation': passwordConfirmation,
      'email': email,
      'phone_number': phoneNumber,
      'role': role,
    };
  }

  String toJson() => json.encode(toMap());
}
