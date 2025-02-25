import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/data/vendor_categories_data.dart';
import 'package:lovify_android/ui/styles/styles.dart';
import 'package:lovify_android/ui/widgets/app_bar.dart';
import 'package:lovify_android/ui/widgets/article_container.dart';
import 'package:lovify_android/ui/widgets/category_button.dart';
import 'package:lovify_android/ui/widgets/highlight_carousel.dart';
import 'package:lovify_android/ui/widgets/vendor_container.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  ScrollController _articleScrollController = ScrollController();
  ScrollController _categoriesScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Padding(
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
              child: HighlightCarousel(),
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
}
