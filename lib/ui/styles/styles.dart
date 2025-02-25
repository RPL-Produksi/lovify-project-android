import 'package:flutter/material.dart';
import 'package:lovify_android/configs/app_colors.dart';

  ButtonStyle actionButtonStyle() {
    return ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          side: BorderSide(color: AppColors.lightGray),
          borderRadius: BorderRadius.circular(100),
        ),
      ),
    );
  }

    TextStyle titleTextStyle() {
    return TextStyle(
      fontSize: 18,
      color: AppColors.spaceCadet,
      fontWeight: FontWeight.bold,
    );
  }