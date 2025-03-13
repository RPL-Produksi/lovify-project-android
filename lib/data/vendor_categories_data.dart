import 'package:flutter/material.dart';
import 'package:lovify_android/configs/app_colors.dart';
import 'package:lovify_android/models/category_model/vendor_category_model.dart';

class VendorCategoriesData {
  final List<VendorCategoryModel> vendorCategories = [
    VendorCategoryModel(
      id: 1,
      name: 'Venue',
      icon: Icon(
        Icons.account_balance,
        color: AppColors.whiteSmoke,
      ),
    ),
    VendorCategoryModel(
      id: 2,
      name: 'MUA',
      icon: Icon(
        Icons.people,
        color: AppColors.whiteSmoke,
      ),
    ),
    VendorCategoryModel(
      id: 3,
      name: 'Catering',
      icon: Icon(
        Icons.restaurant,
        color: AppColors.whiteSmoke,
      ),
    ),
    // VendorCategoryModel(
    //   id: 4,
    //   name: 'Photographer',
    //   icon: Icon(
    //     Icons.camera_alt,
    //     color: AppColors.whiteSmoke,
    //   ),
    // ),
    VendorCategoryModel(
      id: 5,
      name: 'Organize',
      icon: Icon(
        Icons.today,
        color: AppColors.whiteSmoke,
      ),
    ),
    VendorCategoryModel(
      id: 6,
      name: 'View All',
      icon: Icon(
        Icons.arrow_forward_ios,
        color: AppColors.whiteSmoke,
      ),
    ),
  ];
}
