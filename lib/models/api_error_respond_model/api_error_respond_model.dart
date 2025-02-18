import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'message_error_model.dart';

class ApiErrorRespondModel extends Equatable {
  final String? status;
  final dynamic message;

  const ApiErrorRespondModel({this.status, this.message});

  factory ApiErrorRespondModel.fromMap(Map<String, dynamic> data) {
    return ApiErrorRespondModel(
      status: data['status'] as String?,
      message: data['message'] == null
          ? data['error'] as String?
          : data['message'] is String?
              ? data['message'] as String?
              : MessageErrorModel.fromMap(
                  data['message'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message is String? ? message : message?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ApiErrorRespondModel].
  factory ApiErrorRespondModel.fromJson(String data) {
    return ApiErrorRespondModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ApiErrorRespondModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, message];
}
