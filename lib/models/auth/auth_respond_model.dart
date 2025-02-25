import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthRespondModel extends Equatable {
  final String? id;
  final String? fullname;
  final String? username;
  final String? email;
  final String? avatar;
  final String? role;
  final dynamic phoneVerified;
  final dynamic emailVerified;
  final String? phoneNumber;
  final String? token;

  const AuthRespondModel({
    this.id,
    this.fullname,
    this.username,
    this.email,
    this.avatar,
    this.role,
    this.phoneVerified,
    this.emailVerified,
    this.phoneNumber,
    this.token,
  });

  factory AuthRespondModel.fromMap(Map<String, dynamic> data) {
    return AuthRespondModel(
      id: data['id'] as String?,
      fullname: data['fullname'] as String?,
      username: data['username'] as String?,
      email: data['email'] as String?,
      avatar: data['avatar'] as String?,
      role: data['role'] as String?,
      emailVerified: data['email_verified'] as dynamic,
      phoneVerified: data['phone_verified'] as dynamic,
      phoneNumber: data['phone_number'] as String?,
      token: data['token'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'fullname': fullname,
        'username': username,
        'email': email,
        'avatar': avatar,
        'role': role,
        'email_verified': emailVerified,
        'phone_verified': phoneVerified,
        'phone_number': phoneNumber,
        'token': token,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [AuthRespondModel].
  factory AuthRespondModel.fromJson(String data) {
    return AuthRespondModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [AuthRespondModel] to a JSON string.
  String toJson() => json.encode(toMap());

  AuthRespondModel copyWith({
    String? id,
    String? fullname,
    String? username,
    String? email,
    dynamic phoneVerified,
    String? avatar,
    String? role,
    dynamic emailVerified,
    String? phoneNumber,
    String? token,
  }) {
    return AuthRespondModel(
      id: id ?? this.id,
      fullname: fullname ?? this.fullname,
      username: username ?? this.username,
      email: email ?? this.email,
      phoneVerified: phoneVerified ?? this.phoneVerified,
      avatar: avatar ?? this.avatar,
      role: role ?? this.role,
      emailVerified: emailVerified ?? this.emailVerified,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      token: token ?? this.token,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      fullname,
      username,
      email,
      phoneVerified,
      avatar,
      role,
      emailVerified,
      phoneNumber,
      token,
    ];
  }
}
