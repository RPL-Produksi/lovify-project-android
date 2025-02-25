import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/configs/app_colors.dart';
import 'package:lovify_android/cubits/home_cubit/home_cubit.dart';
import 'package:lovify_android/data/vendor_categories_data.dart';
import 'package:lovify_android/models/category_model/vendor_category_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CarouselSliderController _carouselSliderController =
      CarouselSliderController();
  final ScrollController _categoriesScrollController = ScrollController();
  final ScrollController _articleScrollController = ScrollController();

  int _currentPage = 0;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: SafeArea(
        left: false,
        right: false,
        bottom: false,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setState(() => _currentIndex = index),
            unselectedItemColor: AppColors.spaceCadet,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            unselectedLabelStyle: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.spaceCadet,
              ),
            ),
            selectedLabelStyle: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: AppColors.deepRed,
              ),
            ),
            selectedItemColor: AppColors.deepRed,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 32,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.store,
                  size: 32,
                ),
                label: 'Vendors',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.edit_calendar,
                  size: 32,
                ),
                label: 'Plan',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.assignment,
                  size: 32,
                ),
                label: 'Order',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  size: 32,
                ),
                label: 'Profile',
              ),
            ],
          ),
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.only(
              left: 24,
              top: 20,
            ),
            child: RefreshIndicator(
              onRefresh: () async {},
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: appBar(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: SizedBox(
                      height: 35,
                      child: TextField(
                        decoration: InputDecoration(
                          hintStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.only(left: 4),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 18,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(64),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 24),
                    child: highlightCarousel(),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  categoriesListView(),
                  articleListView(),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          'Recommended for you!',
                          style: GoogleFonts.plusJakartaSans(
                            textStyle: titleTextStyle(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, mainAxisExtent: 250),
                          itemCount: 8,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) =>
                              vendorContainer(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding vendorContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
                height: 150,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: AppColors.lightGray,
                      child: Image.asset(
                        'assets/images/lovify-logo.png',
                        scale: 3,
                      ),
                    ),
                    Positioned(
                        top: 110,
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
                        height: 18,
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

  Column articleListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            'Wedding Ideas',
            style: GoogleFonts.plusJakartaSans(
              textStyle: titleTextStyle(),
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        LimitedBox(
          maxWidth: 327,
          maxHeight: 230,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            controller: _articleScrollController,
            itemCount: 3,
            itemBuilder: (context, index) => articleContainer(),
          ),
        ),
      ],
    );
  }

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

  Column categoriesListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 4),
          child: Text(
            'Vendor Category',
            style: GoogleFonts.plusJakartaSans(
              textStyle: titleTextStyle(),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.zero,
          child: LimitedBox(
            maxHeight: 100,
            child: Padding(
              padding: EdgeInsets.zero,
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                controller: _categoriesScrollController,
                itemCount: VendorCategoriesData().vendorCategories.length,
                itemBuilder: (context, index) {
                  final data = VendorCategoriesData().vendorCategories[index];
                  return categoryButton(data);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  TextStyle titleTextStyle() {
    return TextStyle(
      fontSize: 18,
      color: AppColors.spaceCadet,
      fontWeight: FontWeight.bold,
    );
  }

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

  Column highlightCarousel() {
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
}
