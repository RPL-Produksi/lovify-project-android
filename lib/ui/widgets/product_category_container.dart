import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/configs/app_colors.dart';

Stack productCategoryContainer({
  String? text,
  String? imagePath,
}) {
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.all(4.0),
        child: SizedBox(
          width: double.infinity,
          child: LayoutBuilder(
            builder: (context, constraints) {
              double size = constraints.maxWidth; // Ambil lebar sebagai tinggi
              return Container(
                width: size,
                height: size, // Tinggi = Lebar agar kotak
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 1.5, sigmaY: 1.5),
                        child: imagePath == null
                        ? Image.asset(
                            'assets/images/wedding.png',
                            scale: 3,
                          )
                        : CachedNetworkImage(
                            imageUrl: imagePath,
                            progressIndicatorBuilder:
                                (context, url, progress) => Center(
                              child: CircularProgressIndicator(
                                value: progress.progress,
                                color: AppColors.deepRed,
                              ),
                            ),
                            errorWidget: (context, url, error) => Center(
                              child: Icon(
                                Icons.error,
                                color: AppColors.deepRed,
                              ),
                            ),
                          ),
                      ),
                    ),
                    Positioned.fill(
                      child: Center(
                        child: Text(
                          text ?? 'N/A',
                          style: GoogleFonts.plusJakartaSans(
                            textStyle: TextStyle(
                              fontSize: 16, // Bisa disesuaikan
                              color: AppColors.whiteSmoke,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    ],
  );
}
