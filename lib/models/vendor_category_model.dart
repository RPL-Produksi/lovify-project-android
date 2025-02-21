import 'package:flutter/material.dart';

class VendorCategoryModel {
  final int id;
  final String name;
  final Icon icon;

  VendorCategoryModel({
    required this.id,
    required this.name,
    required this.icon,
  });

  VendorCategoryModel copyWith({
    int? id,
    String? name,
    Icon? icon,
  }) {
    return VendorCategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
    );
  }
}
