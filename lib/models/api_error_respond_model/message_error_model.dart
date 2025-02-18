import 'dart:convert';

import 'package:equatable/equatable.dart';

class MessageErrorModel extends Equatable {
  final List<dynamic>? fullname;
  final List<dynamic>? username;
  final List<dynamic>? password;
  final List<dynamic>? email;
  final List<dynamic>? phoneNumber;
  final List<dynamic>? role;

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
        fullname: data['fullname'] as List<dynamic>?,
        username: data['username'] as List<dynamic>?,
        password: data['password'] as List<dynamic>?,
        email: data['email'] as List<dynamic>?,
        phoneNumber: data['phone_number'] as List<dynamic>?,
        role: data['role'] as List<dynamic>?,
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

  @override
  String toString() {
    var str = '';
    fullname?.forEach((element) {
      str += '$element\n';
    });
    username?.forEach((element) {
      str += '$element\n';
    });
    password?.forEach((element) {
      str += '$element\n';
    });
    email?.forEach((element) {
      str += '$element\n';
    });
    phoneNumber?.forEach((element) {
      str += '$element\n';
    });
    role?.forEach((element) {
      str += '$element\n';
    });
    return str;
  }
}
