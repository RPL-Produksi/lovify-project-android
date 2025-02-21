import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'product_model.dart';

class ProductsRespondModel extends Equatable {
  final String? status;
  final String? message;
  final List<ProductModel>? data;

  const ProductsRespondModel({this.status, this.message, this.data});

  factory ProductsRespondModel.fromMap(Map<String, dynamic> data) {
    return ProductsRespondModel(
      status: data['status'] as String?,
      message: data['message'] as String?,
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProductsRespondModel].
  factory ProductsRespondModel.fromJson(String data) {
    return ProductsRespondModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProductsRespondModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, message, data];
}
