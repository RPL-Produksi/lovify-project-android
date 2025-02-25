import 'package:flutter/material.dart';
import 'package:lovify_android/configs/app_colors.dart';
import 'package:lovify_android/models/category_model/vendor_category_model.dart';

class VendorCategoriesData {
  final List<VendorCategoryModel> vendorCategories = [
    VendorCategoryModel(
      id: 1,
      name: 'Attire',
      icon: Icon(
        Icons.checkroom,
        color: AppColors.whiteSmoke,
      ),
    ),
    VendorCategoryModel(
      id: 2,
      name: 'Make Up',
      icon: Icon(
        Icons.brush,
        color: AppColors.whiteSmoke,
      ),
    ),
    VendorCategoryModel(
      id: 3,
      name: 'Hairdo',
      icon: Icon(
        Icons.content_cut,
        color: AppColors.whiteSmoke,
      ),
    ),
    VendorCategoryModel(
      id: 4,
      name: 'Catering',
      icon: Icon(
        Icons.restaurant,
        color: AppColors.whiteSmoke,
      ),
    ),
    VendorCategoryModel(
      id: 5,
      name: 'Venue',
      icon: Icon(
        Icons.account_balance,
        color: AppColors.whiteSmoke,
      ),
    ),
    VendorCategoryModel(
      id: 6,
      name: 'Decor',
      icon: Icon(
        Icons.photo,
        color: AppColors.whiteSmoke,
      ),
    ),
    VendorCategoryModel(
      id: 7,
      name: 'View All',
      icon: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.whiteSmoke,
      ),
    ),
  ];
}
