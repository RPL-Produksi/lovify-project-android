import 'dart:convert';

import 'package:equatable/equatable.dart';

class AuthRespondModel extends Equatable {
  final String? id;
  final String? fullname;
  final String? username;
  final String? email;
  final int? phoneVerified;
  final String? avatar;
  final String? role;
  final dynamic isVerified;
  final String? phoneNumber;
  final String? token;

  const AuthRespondModel({
    this.id,
    this.fullname,
    this.username,
    this.email,
    this.phoneVerified,
    this.avatar,
    this.role,
    this.isVerified,
    this.phoneNumber,
    this.token,
  });

  factory AuthRespondModel.fromMap(Map<String, dynamic> data) {
    return AuthRespondModel(
      id: data['id'] as String?,
      fullname: data['fullname'] as String?,
      username: data['username'] as String?,
      email: data['email'] as String?,
      phoneVerified: data['phone_verified'] as int?,
      avatar: data['avatar'] as String?,
      role: data['role'] as String?,
      isVerified: data['is_verified'] as dynamic,
      phoneNumber: data['phone_number'] as String?,
      token: data['token'] as String?,
    );
  }

  Map<String, dynamic> toMap() => {
        'id': id,
        'fullname': fullname,
        'username': username,
        'email': email,
        'phone_verified': phoneVerified,
        'avatar': avatar,
        'role': role,
        'is_verified': isVerified,
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
    int? phoneVerified,
    String? avatar,
    String? role,
    dynamic isVerified,
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
      isVerified: isVerified ?? this.isVerified,
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
      isVerified,
      phoneNumber,
      token,
    ];
  }
}
