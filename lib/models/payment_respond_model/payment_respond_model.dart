import 'dart:convert';

import 'payment_transaction_model.dart';

class PaymentRespondModel {
  String? status;
  String? message;
  PaymentTransactionModel? data;

  PaymentRespondModel({this.status, this.message, this.data});

  factory PaymentRespondModel.fromMap(Map<String, dynamic> data) {
    return PaymentRespondModel(
      status: data['status'] as String?,
      message: data['message'] as String?,
      data: data['data'] == null
          ? null
          : PaymentTransactionModel.fromMap(data['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'message': message,
        'data': data?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentRespondModel].
  factory PaymentRespondModel.fromJson(String data) {
    return PaymentRespondModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PaymentRespondModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
