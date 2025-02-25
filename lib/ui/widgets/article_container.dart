import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/configs/app_colors.dart';

  Padding articleContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 245,
          height: 230,
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
                width: 245,
                height: 120,
                child: Container(
                  color: AppColors.lightGray,
                  child: Image.asset(
                    'assets/images/lovify-logo.png',
                    scale: 3,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Wedding preparation',
                        style: GoogleFonts.plusJakartaSans(
                          textStyle: TextStyle(
                            fontSize: 12,
                            color: AppColors.deepRed,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      'Tampil Beda! Pakai Kebaya Modern dan Unik, Siap Buat Hari Spesialmu Makin Cantik!',
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          fontSize: 12,
                          color: AppColors.spaceCadet,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

 
