import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'planning_product_model.dart';

class PlanningModel extends Equatable {
  final String? id;
  final String? title;
  final String? description;
  final List<PlanningProductModel>? products;

  const PlanningModel({this.id, this.title, this.description, this.products});

  factory PlanningModel.fromMap(Map<String, dynamic> data) => PlanningModel(
        id: data['id'] as String?,
        title: data['title'] as String?,
        description: data['description'] as String?,
        products: (data['products'] as List<dynamic>?)
            ?.map(
                (e) => PlanningProductModel.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'description': description,
        'products': products?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlanningModel].
  factory PlanningModel.fromJson(String data) {
    return PlanningModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlanningModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [id, title, description, products];
}
