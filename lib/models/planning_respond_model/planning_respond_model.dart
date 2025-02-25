import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'planning_model.dart';

class PlanningRespondModel extends Equatable {
  final String? status;
  final String? message;
  final List<PlanningModel>? data;

  const PlanningRespondModel({this.status, this.message, this.data});

  factory PlanningRespondModel.fromMap(Map<String, dynamic> data) {
    return PlanningRespondModel(
      status: data['status'] as String?,
      message: data['message'] as String?,
      data: (data['data'] as List<dynamic>?)
          ?.map((e) => PlanningModel.fromMap(e as Map<String, dynamic>))
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
  /// Parses the string and returns the resulting Json object as [PlanningRespondModel].
  factory PlanningRespondModel.fromJson(String data) {
    return PlanningRespondModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlanningRespondModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [status, data];
}
