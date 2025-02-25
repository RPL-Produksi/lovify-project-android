import 'dart:convert';

class PaymentModel {
  String? paymentType;
  DateTime? paymentDate;
  int? amount;
  String? orderId;
  String? id;
  DateTime? updatedAt;
  DateTime? createdAt;

  PaymentModel({
    this.paymentType,
    this.paymentDate,
    this.amount,
    this.orderId,
    this.id,
    this.updatedAt,
    this.createdAt,
  });

  factory PaymentModel.fromMap(Map<String, dynamic> data) => PaymentModel(
        paymentType: data['payment_type'] as String?,
        paymentDate: data['payment_date'] == null
            ? null
            : DateTime.parse(data['payment_date'] as String),
        amount: data['amount'] as int?,
        orderId: data['order_id'] as String?,
        id: data['id'] as String?,
        updatedAt: data['updated_at'] == null
            ? null
            : DateTime.parse(data['updated_at'] as String),
        createdAt: data['created_at'] == null
            ? null
            : DateTime.parse(data['created_at'] as String),
      );

  Map<String, dynamic> toMap() => {
        'payment_type': paymentType,
        'payment_date': paymentDate?.toIso8601String(),
        'amount': amount,
        'order_id': orderId,
        'id': id,
        'updated_at': updatedAt?.toIso8601String(),
        'created_at': createdAt?.toIso8601String(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PaymentModel].
  factory PaymentModel.fromJson(String data) {
    return PaymentModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PaymentModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
