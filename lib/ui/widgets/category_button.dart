import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/configs/app_colors.dart';
import 'package:lovify_android/models/vendor_category_model.dart';

Padding categoryButton(VendorCategoryModel data) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: data.icon,
            style: ButtonStyle(
              minimumSize: WidgetStatePropertyAll(Size(50, 50)),
              backgroundColor: WidgetStatePropertyAll(AppColors.deepRed),
            ),
          ),
          Text(
            data.name,
            style: GoogleFonts.plusJakartaSans(
              color: AppColors.spaceCadet,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }