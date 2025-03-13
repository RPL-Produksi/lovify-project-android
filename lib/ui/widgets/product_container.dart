import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lovify_android/configs/app_colors.dart';

Padding productContainer({
  String? imagePath,
  String? location,
  String? productName,
  String? vendor,
  int? price,
}) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Container(
      width: 250,
      height: 135,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.lightGray,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 135,
            child: Stack(
              children: [
                SizedBox.expand(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      border: Border.all(
                        color: AppColors.lightGray,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                    ),
                    child: imagePath == null
                        ? Image.asset(
                            'assets/images/lovify-logo.png',
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
                Positioned(
                  top: 100,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 60,
                      height: 20,
                      decoration: BoxDecoration(
                          color: AppColors.whiteSmoke,
                          borderRadius: BorderRadius.circular(12)),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Icon(
                              Icons.location_pin,
                              size: 14,
                              color: AppColors.deepRed,
                            ),
                          ),
                          Text(
                            location ?? 'Jakarta',
                            style: GoogleFonts.plusJakartaSans(
                              textStyle: TextStyle(
                                fontSize: 10,
                                color: AppColors.deepRed,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      productName ?? 'Wedding Dress Package',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: AppColors.spaceCadet,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'By ${vendor ?? 'wirantikurniabride'}',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          fontSize: 8,
                          color: AppColors.spaceCadet,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      price == null
                          ? 'Rp. 10.000.000'
                          : 'Rp. ${NumberFormat.decimalPattern('id').format(price)}',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: AppColors.deepRed,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
