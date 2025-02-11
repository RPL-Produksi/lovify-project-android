import 'dart:convert';

import 'package:equatable/equatable.dart';

class MessageErrorModel extends Equatable {
  final List<String>? fullname;
  final List<String>? username;
  final List<String>? password;
  final List<String>? email;
  final List<String>? phoneNumber;
  final List<String>? role;

  const MessageErrorModel({
    this.fullname,
    this.username,
    this.password,
    this.email,
    this.phoneNumber,
    this.role,
  });

  factory MessageErrorModel.fromMap(Map<String, dynamic> data) =>
      MessageErrorModel(
        fullname: data['fullname'] as List<String>?,
        username: data['username'] as List<String>?,
        password: data['password'] as List<String>?,
        email: data['email'] as List<String>?,
        phoneNumber: data['phone_number'] as List<String>?,
        role: data['role'] as List<String>?,
      );

  Map<String, dynamic> toMap() => {
        'fullname': fullname,
        'username': username,
        'password': password,
        'email': email,
        'phone_number': phoneNumber,
        'role': role,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [MessageErrorModel].
  factory MessageErrorModel.fromJson(String data) {
    return MessageErrorModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [MessageErrorModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      fullname,
      username,
      password,
      email,
      phoneNumber,
      role,
    ];
  }
}
