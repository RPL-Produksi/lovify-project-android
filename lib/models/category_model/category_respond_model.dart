import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'category_model.dart';

class CategoryRespondModel extends Equatable {
  final String? status;
  final String? message;
  final List<CategoryModel>? data;

  const CategoryRespondModel({this.status, this.message, this.data});

  factory CategoryRespondModel.fromMap(Map<String, dynamic> data) => CategoryRespondModel(
        status: data['status'] as String?,
        message: data['message'] as String?,
        data: (data['data'] as List<dynamic>?)
            ?.map((e) => CategoryModel.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CategoryRespondModel].
  factory CategoryRespondModel.fromJson(String data) {
    return CategoryRespondModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CategoryRespondModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, message, data];
}
