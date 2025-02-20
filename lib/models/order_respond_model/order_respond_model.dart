import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'order_model.dart';

class OrderRespondModel extends Equatable {
  final String? status;
  final String? message;
  final OrderModel? orders;

  const OrderRespondModel({this.status, this.message, this.orders});

  factory OrderRespondModel.fromMap(Map<String, dynamic> data) {
    return OrderRespondModel(
      status: data['status'] as String?,
      message: data['message'] as String?,
      orders: data['data'] == null
          ? null
          : OrderModel.fromMap(data['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
        'data': orders?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrderRespondModel].
  factory OrderRespondModel.fromJson(String data) {
    return OrderRespondModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OrderRespondModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, message, orders];
}
