import 'dart:convert';

import 'payment_model.dart';

class PaymentTransactionModel {
  String? snapToken;
  PaymentModel? payment;

  PaymentTransactionModel({this.snapToken, this.payment});

  factory PaymentTransactionModel.fromMap(Map<String, dynamic> data) =>
      PaymentTransactionModel(
        snapToken: data['snap_token'] as String?,
        payment: data['payment'] == null
            ? null
            : PaymentModel.fromMap(data['payment'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'snap_token': snapToken,
        'payment': payment?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentTransactionModel].
  factory PaymentTransactionModel.fromJson(String data) {
    return PaymentTransactionModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PaymentTransactionModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
