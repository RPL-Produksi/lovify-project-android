import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/configs/app_colors.dart';
import 'package:lovify_android/cubits/home_cubit/home_cubit.dart';
import 'package:lovify_android/ui/pages/home/home_view.dart';
import 'package:lovify_android/ui/pages/home/vendors_view.dart';
import 'package:lovify_android/ui/widgets/app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomeView(),
    VendorsView()
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            
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
            body: _pages[_currentIndex],
          );
        },
      ),
    );
  }
}
