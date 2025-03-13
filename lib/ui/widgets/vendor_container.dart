import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/configs/app_colors.dart';

Padding vendorContainer() {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: SizedBox(
      width: 250,
      height: 125,
      child: Container(
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
                  Container(
                    width: double.infinity,
                    height: double.infinity,
                    
                    decoration: BoxDecoration(
                      color: AppColors.lightGray,
                      border: Border.all(
                        color: AppColors.lightGray,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)),
                    ),
                    child: Image.asset(
                      'assets/images/lovify-logo.png',
                      scale: 3,
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
                                'Jakarta',
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
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Wedding Dress Package',
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
                        'By wirantikurniabride',
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
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Rp. 10.000.000',
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
    ),
  );
}
