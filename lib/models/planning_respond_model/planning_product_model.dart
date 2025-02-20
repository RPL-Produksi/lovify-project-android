import 'dart:convert';

import 'package:equatable/equatable.dart';

class PlanningProductModel extends Equatable {
  final String? id;
  final String? name;
  final String? slug;
  final int? price;
  final String? location;
  final String? category;
  final String? vendor;

  const PlanningProductModel({
    this.id,
    this.name,
    this.slug,
    this.price,
    this.location,
    this.category,
    this.vendor,
  });

  factory PlanningProductModel.fromMap(Map<String, dynamic> data) =>
      PlanningProductModel(
        id: data['id'] as String?,
        name: data['name'] as String?,
        slug: data['slug'] as String?,
        price: data['price'] as int?,
        location: data['location'] as String?,
        category: data['category'] as String?,
        vendor: data['vendor'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'slug': slug,
        'price': price,
        'location': location,
        'category': category,
        'vendor': vendor,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [PlanningProductModel].
  factory PlanningProductModel.fromJson(String data) {
    return PlanningProductModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [PlanningProductModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      name,
      slug,
      price,
      location,
      category,
      vendor,
    ];
  }
}
