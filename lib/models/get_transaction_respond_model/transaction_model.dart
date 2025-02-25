import 'dart:convert';

import 'package:lovify_android/models/order_respond_model/order_model.dart';
import 'package:lovify_android/models/planning_respond_model/planning_model.dart';

class TransactionModel {
  String? id;
  int? amount;
  DateTime? paymentDate;
  String? paymentType;
  String? status;
  OrderModel? order;
  PlanningModel? planning;

  TransactionModel({
    this.id,
    this.amount,
    this.paymentDate,
    this.paymentType,
    this.status,
    this.order,
    this.planning,
  });

  factory TransactionModel.fromMap(Map<String, dynamic> data) => TransactionModel(
        id: data['id'] as String?,
        amount: data['amount'] as int?,
        paymentDate: data['payment_date'] == null
            ? null
            : DateTime.parse(data['payment_date'] as String),
        paymentType: data['payment_type'] as String?,
        status: data['status'] as String?,
        order: data['order'] == null
            ? null
            : OrderModel.fromMap(data['order'] as Map<String, dynamic>),
        planning: data['planning'] == null
            ? null
            : PlanningModel.fromMap(data['planning'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'amount': amount,
        'payment_date': paymentDate?.toIso8601String(),
        'payment_type': paymentType,
        'status': status,
        'order': order?.toMap(),
        'planning': planning?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [TransactionModel].
  factory TransactionModel.fromJson(String data) {
    return TransactionModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [TransactionModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
