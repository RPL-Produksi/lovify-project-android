import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/configs/app_colors.dart';
import 'package:lovify_android/cubits/home_cubit/home_cubit.dart';
import 'package:lovify_android/data/vendor_categories_data.dart';
import 'package:lovify_android/models/products_respond_model/product_model.dart';
import 'package:lovify_android/ui/styles/styles.dart';
import 'package:lovify_android/ui/widgets/article_container.dart';
import 'package:lovify_android/ui/widgets/category_button.dart';
import 'package:lovify_android/ui/widgets/highlight_carousel.dart';
import 'package:lovify_android/ui/widgets/product_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _articleScrollController = ScrollController();
  final ScrollController _categoriesScrollController = ScrollController();

  List<ProductModel> recommendedProducts = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 24,
        left: 24,
        top: 20,
      ),
      child: RefreshIndicator(
        onRefresh: () async {
          context.read<HomeCubit>().getProducts();
        },
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(
              height: 10,
            ),
            SizedBox(
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
            SizedBox(
              height: 20,
            ),
            HighlightCarousel(),
            SizedBox(
              height: 10,
            ),
            categoriesListView(),
            articleListView(),
            SizedBox(
              height: 10,
            ),
            recommendationGridBuilder(),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  BlocConsumer<HomeCubit, HomeState> recommendationGridBuilder() {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is ProductsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.respond.message.toString(),
                textAlign: TextAlign.center,
              ),
              duration: Duration(seconds: 2),
              backgroundColor: AppColors.deepRed,
            ),
          );
        }
      },
      builder: (context, state) {
        var products = context.read<HomeCubit>().products;
        if (products.isEmpty) {
          context.read<HomeCubit>().getProducts();
        }
        if (recommendedProducts.isEmpty) {
          recommendedProducts.addAll(products);
        }

        return Column(
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
            if (state is HomeLoading)
              Center(
                child: CircularProgressIndicator(
                  color: AppColors.deepRed,
                ),
              )
            else
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns
                  crossAxisSpacing: 0, // Spacing between columns
                  mainAxisSpacing: 0, // Spacing between rows
                  childAspectRatio: 1, // Aspect ratio of each item
                  mainAxisExtent: 210,
                ),
                itemCount: recommendedProducts.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var product = recommendedProducts[index];

                  return InkWell(
                    child: productContainer(
                      imagePath: product.cover,
                      location: product.location,
                      price: product.price,
                      productName: product.name,
                      vendor: product.vendor,
                    ),
                    onTap: () => context.push('/vendorDetail'),
                  );
                },
              ),
          ],
        );
      },
    );
  }

  Column categoriesListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
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

  Column articleListView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
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
}
