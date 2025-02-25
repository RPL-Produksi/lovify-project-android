import 'dart:convert';

import 'transaction_model.dart';

class GetTransactionRespondModel {
  String? status;
  List<TransactionModel>? data;

  GetTransactionRespondModel({this.status, this.data});

  factory GetTransactionRespondModel.fromMap(Map<String, dynamic> data) {
    return GetTransactionRespondModel(
      status: data['status'] as String?,
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => TransactionModel.fromMap(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        'status': status,
        'data': data?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [GetTransactionRespondModel].
  factory GetTransactionRespondModel.fromJson(String data) {
    return GetTransactionRespondModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [GetTransactionRespondModel] to a JSON string.
  String toJson() => json.encode(toMap());
}
