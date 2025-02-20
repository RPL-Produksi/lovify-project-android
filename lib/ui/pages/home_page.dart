import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/configs/app_colors.dart';
import 'package:lovify_android/cubits/home_cubit/home_cubit.dart';
import 'package:lovify_android/data/vendor_categories_data.dart';
import 'package:lovify_android/models/vendor_category_model.dart';
import 'package:lovify_android/util/manage_token.dart';
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

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (context.read<HomeCubit>().categories.isEmpty &&
              state is HomeIdle) {
            context.read<HomeCubit>().getCategories();
          }
          if (state is CategoriesError) {
            // TODO: error get kategori di sini
            showDialog(
              context: context,
              builder: (context) => Dialog(
                child: Text(
                  state.respond.message.toString(),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (context.read<HomeCubit>().categories.isEmpty) {
            context.read<HomeCubit>().getCategories();
          }
          return SafeArea(
            left: false,
            right: false,
            bottom: false,
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              floatingActionButton: IconButton(
                onPressed: () => ManageToken.deleteToken(),
                icon: Icon(Icons.refresh),
              ),
              body: Padding(
                padding: const EdgeInsets.only(
                  left: 32,
                  right: 32,
                  top: 20,
                ),
                child: state is HomeLoading
                    ? Center(
                        child: CircularProgressIndicator(
                          color: AppColors.deepRed,
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: () async {
                          context.read<HomeCubit>().getCategories();
                        },
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            appBar(),
                            SizedBox(
                              height: 20,
                            ),
                            SearchBar(
                              backgroundColor:
                                  WidgetStatePropertyAll(AppColors.whiteSmoke),
                              enabled: false,
                              leading: Icon(
                                Icons.search,
                                color: AppColors.spaceCadet,
                              ),
                              side: WidgetStatePropertyAll(
                                BorderSide(
                                  color: AppColors.spaceCadet,
                                  width: 2,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            highlightCarousel(),
                            categoriesListView(),
                            articleListView(),
                            SizedBox(
                              height: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Recommended for you!',
                                  style: GoogleFonts.plusJakartaSans(
                                    textStyle: titleTextStyle(),
                                  ),
                                ),
                                GridView.builder(
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                  ),
                                  itemCount: 8,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          placeholderContainer(),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          );
        },
      ),
    );
  }

  Column articleListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Wedding Ideas',
          style: GoogleFonts.plusJakartaSans(
            textStyle: titleTextStyle(),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        LimitedBox(
          maxWidth: 327,
          maxHeight: 211,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            controller: _articleScrollController,
            itemCount: 3,
            itemBuilder: (context, index) => placeholderContainer(),
          ),
        ),
      ],
    );
  }

  Padding placeholderContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          width: 245,
          height: 211,
          color: AppColors.lightGray,
          child: Image.asset(
            'assets/images/lovify-logo.png',
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
        Text(
          'Vendor Category',
          style: GoogleFonts.plusJakartaSans(
            textStyle: titleTextStyle(),
          ),
        ),
        LimitedBox(
          maxWidth: 327,
          maxHeight: 100,
          child: ListView.builder(
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
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {},
            icon: data.icon,
            style: ButtonStyle(
              minimumSize: WidgetStatePropertyAll(Size(45, 45)),
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
        CarouselSlider.builder(
          itemCount: 3,
          itemBuilder: (context, index, realIndex) => ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 327,
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
            viewportFraction: 0.9,
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedSmoothIndicator(
            activeIndex: _currentPage,
            count: 3,
            onDotClicked: (index) => setState(
              () => _carouselSliderController.jumpToPage(index),
            ),
            effect: ExpandingDotsEffect(
              dotHeight: 8,
              dotWidth: 14,
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
