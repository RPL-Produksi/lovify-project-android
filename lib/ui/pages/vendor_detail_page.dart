import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/configs/app_colors.dart';
import 'package:lovify_android/ui/widgets/app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class VendorDetailPage extends StatefulWidget {
  const VendorDetailPage({super.key});

  @override
  State<VendorDetailPage> createState() => _VendorDetailPageState();
}

class _VendorDetailPageState extends State<VendorDetailPage> {
  CarouselSliderController _carouselSliderController =
      CarouselSliderController();

  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 24, top: 20, left: 24),
              child: appBar(),
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                CarouselSlider.builder(
                  carouselController: _carouselSliderController,
                  itemCount: 3,
                  itemBuilder: (context, index, realIndex) =>
                      Image.asset('assets/images/dress.png'),
                  options: CarouselOptions(
                    height: 350,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) =>
                        setState(() => _currentPage = index),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 150,
                  child: SizedBox(
                    child: AnimatedSmoothIndicator(
                      effect: WormEffect(
                        dotWidth: 10,
                        dotHeight: 10,
                        spacing: 8,
                        activeDotColor: Colors.black,
                      ),
                      activeIndex: _currentPage,
                      count: 3,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rp. 10.000.000',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: AppColors.deepRed,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    'Wedding Dress Package',
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                        fontSize: 14,
                        color: AppColors.spaceCadet,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: AppColors.lightGray),
                      bottom: BorderSide(color: AppColors.lightGray),
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Row(
                      children: [
                        Image.asset('assets/images/vendor_image.png'),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Wiranti Kurnia Bride',
                              style: GoogleFonts.plusJakartaSans(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.spaceCadet,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              'Attire - Jakarta',
                              textAlign: TextAlign.start,
                              style: GoogleFonts.plusJakartaSans(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: AppColors.spaceCadet,
                                ),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                        Stack(alignment: Alignment.centerRight, children: [
                          Container(
                            width: 75,
                            height: 20,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.deepRed),
                                borderRadius: BorderRadius.circular(12)),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'VISIT VENDOR',
                                style: GoogleFonts.plusJakartaSans(
                                  textStyle: TextStyle(
                                      fontSize: 8,
                                      color: AppColors.deepRed,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ])
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
        onRefresh: () async {},
      ),
    );
  }
}
