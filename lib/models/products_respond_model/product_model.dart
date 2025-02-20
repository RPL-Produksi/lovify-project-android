import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  final String? id;
  final String? name;
  final String? slug;
  final String? description;
  final int? price;
  final String? cover;
  final String? vendor;
  final String? location;
  final String? category;
  final List<String>? attachments;

  const ProductModel({
    this.id,
    this.name,
    this.slug,
    this.description,
    this.price,
    this.cover,
    this.vendor,
    this.location,
    this.category,
    this.attachments,
  });

  factory ProductModel.fromMap(Map<String, dynamic> data) => ProductModel(
        id: data['id'] as String?,
        name: data['name'] as String?,
        slug: data['slug'] as String?,
        description: data['description'] as String?,
        price: data['price'] as int?,
        cover: data['cover'] as String?,
        vendor: data['vendor'] as String?,
        location: data['location'] as String?,
        category: data['category'] as String?,
        attachments: data['attachments'] as List<String>?,
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'slug': slug,
        'description': description,
        'price': price,
        'cover': cover,
        'vendor': vendor,
        'location': location,
        'category': category,
        'attachments': attachments,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ProductModel].
  factory ProductModel.fromJson(String data) {
    return ProductModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ProductModel] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props {
    return [
      id,
      name,
      slug,
      description,
      price,
      cover,
      vendor,
      location,
      category,
      attachments,
    ];
  }
}
