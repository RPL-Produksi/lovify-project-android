import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/configs/app_colors.dart';
import 'package:lovify_android/ui/widgets/app_bar.dart';
import 'package:lovify_android/ui/widgets/vendor_container.dart';

class VendorsView extends StatefulWidget {
  const VendorsView({super.key});

  @override
  State<VendorsView> createState() => _VendorsViewState();
}

class _VendorsViewState extends State<VendorsView> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
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
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 0, // Spacing between columns
                mainAxisSpacing: 0, // Spacing between rows
                childAspectRatio: 1, // Aspect ratio of each item
                mainAxisExtent: 225,
              ),
              itemCount: 10,
              scrollDirection: Axis.vertical,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return InkWell(
                  child: vendorContainer(),
                  onTap: () => context.push('/vendorDetail'),
                );
              },
            ),
          ),
        ],
      ),
      onRefresh: () async {},
    );
  }
}
