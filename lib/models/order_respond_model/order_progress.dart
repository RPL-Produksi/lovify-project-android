import 'dart:convert';

import 'package:equatable/equatable.dart';

class OrderProgress extends Equatable {
  final String? product;
  final String? status;

  const OrderProgress({this.product, this.status});

  factory OrderProgress.fromMap(Map<String, dynamic> data) => OrderProgress(
        product: data['product'] as String?,
        status: data['status'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'product': product,
        'status': status,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [OrderProgress].
  factory OrderProgress.fromJson(String data) {
    return OrderProgress.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [OrderProgress] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [product, status];
}
