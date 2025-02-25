import 'package:flutter/material.dart';
import 'package:lovify_android/configs/app_colors.dart';
import 'package:lovify_android/ui/styles/styles.dart';

 Row appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/images/lovify-logo.png',
          width: 100,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none,
                color: AppColors.spaceCadet,
              ),
              style: actionButtonStyle(),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.support_agent,
                color: AppColors.spaceCadet,
              ),
              style: actionButtonStyle(),
            ),
          ],
        ),
      ],
    );
  }