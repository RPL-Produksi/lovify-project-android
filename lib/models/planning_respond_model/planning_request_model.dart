import 'dart:convert';

class PlanningRequestModel {
  final String title;
  final String? description;
  final List<String> productsId;

  PlanningRequestModel({
    required this.title,
    required this.description,
    required this.productsId,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'product_ids': productsId,
    };
  }

  factory PlanningRequestModel.fromMap(Map<String, dynamic> map) {
    return PlanningRequestModel(
      title: map['title'] ?? '',
      description: map['description'],
      productsId: List<String>.from(map['productsId']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PlanningRequestModel.fromJson(String source) =>
      PlanningRequestModel.fromMap(json.decode(source));
}
