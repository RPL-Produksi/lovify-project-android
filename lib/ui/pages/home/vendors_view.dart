import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/configs/app_colors.dart';
import 'package:lovify_android/cubits/home_cubit/home_cubit.dart';
import 'package:lovify_android/models/category_model/category_model.dart';
import 'package:lovify_android/models/products_respond_model/product_model.dart';
import 'package:lovify_android/ui/widgets/product_category_container.dart';
import 'package:lovify_android/ui/widgets/product_container.dart';

class VendorsView extends StatefulWidget {
  const VendorsView({super.key});

  @override
  State<VendorsView> createState() => _VendorsViewState();
}

class _VendorsViewState extends State<VendorsView> {
  List<ProductModel> products = [];
  List<CategoryModel> categories = [];
  CategoryModel? selectedCategory;
  bool showAllVendor = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var categories = context.read<HomeCubit>().categories;
        if (this.categories.isEmpty) {
          context.read<HomeCubit>().getCategories();
          this.categories = categories;
        }

        if (selectedCategory != null || showAllVendor) {
          return productsView(
            state: state,
            products: context.read<HomeCubit>().products,
            category: selectedCategory?.name,
          );
        } else {
          return categoriesView(context, state);
        }
      },
    );
  }

  RefreshIndicator categoriesView(BuildContext context, HomeState state) {
    return RefreshIndicator(
      onRefresh: () async {
        showAllVendor = false;
        selectedCategory = null;
        context.read<HomeCubit>().getCategories();
      },
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            color: AppColors.deepRed,
            width: double.infinity,
            height: 50,
            child: Center(
              child: Text(
                'VENDOR CATEGORIES',
                style: GoogleFonts.cinzelDecorative(
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: AppColors.whiteSmoke,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: state is HomeLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.deepRed,
                    ),
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 0, // Spacing between columns
                      mainAxisSpacing: 0, // Spacing between rows
                      childAspectRatio: 1, // Aspect ratio of each item
                      mainAxisExtent: 210,
                    ),
                    itemCount: categories.length,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var category = categories[index];

                      return InkWell(
                        child: productCategoryContainer(
                          text: category.name,
                          imagePath: category.image,
                        ),
                        onTap: () => setState(() {
                          if (category.name!.toLowerCase().contains('all')) {
                            showAllVendor = true;
                            selectedCategory = null;
                            products = context.read<HomeCubit>().products;
                          } else {
                            showAllVendor = false;
                            selectedCategory = category;
                            products = context.read<HomeCubit>().products.where(
                                  (element) => element.category
                                      ?.toLowerCase()
                                      .contains(selectedCategory?.name!
                                          .toLowerCase()),
                                );
                          }
                        }),
                      );
                    },
                  ),
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget productsView({
    required HomeState state,
    required List<ProductModel> products,
    String? category,
  }) {
    return RefreshIndicator(
      onRefresh: () async =>
          context.read<HomeCubit>().getProducts(category: category),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: [
          SizedBox(
            height: 10,
          ),
          Container(
            color: AppColors.deepRed,
            width: double.infinity,
            height: 50,
            child: Center(
              child: Text(
                'VENDORS',
                style: GoogleFonts.cinzelDecorative(
                  textStyle: TextStyle(
                    fontSize: 20,
                    color: AppColors.whiteSmoke,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: state is HomeLoading
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.deepRed,
                    ),
                  )
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      crossAxisSpacing: 0, // Spacing between columns
                      mainAxisSpacing: 0, // Spacing between rows
                      childAspectRatio: 1, // Aspect ratio of each item
                      mainAxisExtent: 210,
                    ),
                    itemCount: products.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var product = products[index];

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
          ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }
}
