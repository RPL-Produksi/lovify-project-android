import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/configs/app_colors.dart';
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

  @override
  Widget build(BuildContext context) {
    Widget selectedPage;

    // TODO: Tambah page baru di sini
    switch (_currentIndex) {
      case 0:
        selectedPage = const HomeView();
        break;
      case 1:
        selectedPage = const VendorsView();
        break;
      default:
        throw UnimplementedError('Page not implemented');
    }

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
          ),
          child: appBar(),
        ),
      ),
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
      body: AnimatedSwitcher(
        duration: Durations.short4,
        child: selectedPage,
      ),
    );
  }
}
