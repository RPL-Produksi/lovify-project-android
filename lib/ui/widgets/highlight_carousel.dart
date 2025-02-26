import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lovify_android/configs/app_colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HighlightCarousel extends StatefulWidget {
  const HighlightCarousel({super.key});

  @override
  State<HighlightCarousel> createState() => _HighlightCarouselState();
}

class _HighlightCarouselState extends State<HighlightCarousel> {
  int _currentPage = 0;

  final CarouselSliderController _carouselSliderController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
  
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 0),
          child: CarouselSlider.builder(
            itemCount: 3,
            itemBuilder: (context, index, realIndex) => ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                width: 350,
                height: 146,
                color: AppColors.lightGray,
                child: Image.asset(
                  'assets/images/lovify-logo.png',
                  scale: 1.8,
                ),
              ),
            ),
            options: CarouselOptions(
              height: 146,
              enlargeCenterPage: true,
              viewportFraction: 1,
              scrollDirection: Axis.horizontal,
              scrollPhysics: BouncingScrollPhysics(),
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayAnimationDuration: Duration(seconds: 2),
              autoPlayInterval: Duration(seconds: 5),
              pauseAutoPlayOnManualNavigate: true,
              pauseAutoPlayOnTouch: true,
              onPageChanged: (index, reason) =>
                  setState(() => _currentPage = index),
            ),
            carouselController: _carouselSliderController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedSmoothIndicator(
            activeIndex: _currentPage,
            count: 3,
            onDotClicked: (index) => setState(
              () => _carouselSliderController.jumpToPage(index),
            ),
            effect: SlideEffect(
              dotHeight: 8,
              dotWidth: 8,
              spacing: 8,
              dotColor: AppColors.lightGray,
              activeDotColor: AppColors.deepRed,
            ),
          ),
        ),
      ],
    );
  }
  }
