import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/configs/app_colors.dart';
import 'package:lovify_android/ui/widgets/primary_button.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardPage extends StatefulWidget {
  const OnBoardPage({super.key});

  @override
  State<OnBoardPage> createState() => _OnBoardPageState();
}

class _OnBoardPageState extends State<OnBoardPage> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/onboard-bg.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Image.asset(
                "assets/images/onboard-fade.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 48),
            child: CarouselSlider(
              items: [
                Column(
                  children: [
                    Text(
                      "Plan Your Perfect Day",
                      style: GoogleFonts.charm(
                        textStyle: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Planning your wedding doesn’t have to be overwhelming. Let us help you create the celebration of your dreams.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Customize & Personalize",
                      style: GoogleFonts.charm(
                        textStyle: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Your wedding, your way. Our platform allows you to customize every detail, from color themes to ceremony setups. ",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Get Started Today",
                      style: GoogleFonts.charm(
                        textStyle: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "Whether you're envisioning an intimate gathering or a grand celebration.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
              options: CarouselOptions(
                height: 165.0, // Height of the carousel
                enlargeCenterPage: true, // Highlight the center text
                viewportFraction:
                    0.9, // Fraction of the width each item occupies
                scrollDirection: Axis.horizontal, // Horizontal scrolling
                scrollPhysics: BouncingScrollPhysics(),
                enableInfiniteScroll: false,

                onPageChanged: (index, reason) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
              carouselController: _carouselController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 1.0),
            child: AnimatedSmoothIndicator(
              activeIndex: _currentPage, // The controller used by the carousel
              count: 3, // Number of pages
              effect: ExpandingDotsEffect(
                dotHeight: 8.0,
                dotWidth: 14.0,
                spacing: 8.0,
                dotColor: const Color.fromARGB(255, 212, 212, 212),
                activeDotColor: const Color(0xFF67191F),
              ),
            ),
          ),
          SizedBox(
            height: 44,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              PrimaryButton(
                text: "Sign In",
                onPressed: () {
                  context.push('/login');
                },
              ),
              SizedBox(
                width: 18,
              ),
              PrimaryButton(
                text: "Next",
                onPressed: () {
                  if (_currentPage != 2) {
                    _carouselController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.linearToEaseOut);
                  } else {
                    context.push('/login');
                  }
                },
                backgroundColor: AppColors.deepRed,
                textColor: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
