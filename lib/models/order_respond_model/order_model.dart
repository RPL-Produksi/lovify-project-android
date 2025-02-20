import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'order_progress.dart';

class OrderModel extends Equatable {
  final String? id;
  final int? totalPrice;
  final int? downPayment;
  final int? remainingPayment;
  final DateTime? dpDeadline;
  final DateTime? paymentDeadline;
  final DateTime? marryDate;
  final String? status;
  final List<OrderProgress>? orderProgress;

  const OrderModel({
    this.id,
    this.totalPrice,
    this.downPayment,
    this.remainingPayment,
    this.dpDeadline,
    this.paymentDeadline,
    this.marryDate,
    this.status,
    this.orderProgress,
  });

  factory OrderModel.fromMap(Map<String, dynamic> data) => OrderModel(
        id: data['id'] as String?,
        totalPrice: data['total_price'] as int?,
        downPayment: data['down_payment'] as int?,
        remainingPayment: data['remaining_payment'] as int?,
        dpDeadline: data['dp_deadline'] == null
            ? null
            : DateTime.parse(data['dp_deadline'] as String),
        paymentDeadline: data['payment_deadline'] == null
            ? null
            : DateTime.parse(data['payment_deadline'] as String),
        marryDate: data['marry_date'] == null
            ? null
            : DateTime.parse(data['marry_date'] as String),
        status: data['status'] as String?,
        orderProgress: (data['order_progress'] as List<dynamic>?)
            ?.map((e) => OrderProgress.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'total_price': totalPrice,
        'down_payment': downPayment,
        'remaining_payment': remainingPayment,
        'dp_deadline': dpDeadline?.toIso8601String(),
        'payment_deadline': paymentDeadline?.toIso8601String(),
        'marry_date': marryDate?.toIso8601String(),
        'status': status,
        'order_progress': orderProgress?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrderModel].
  factory OrderModel.fromJson(String data) {
    return OrderModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OrderModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      totalPrice,
      downPayment,
      remainingPayment,
      dpDeadline,
      paymentDeadline,
      marryDate,
      status,
      orderProgress,
    ];
  }
}
