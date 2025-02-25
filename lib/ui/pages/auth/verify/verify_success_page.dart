import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class VerifySuccessPage extends StatelessWidget {
  const VerifySuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/lottie/check_animation.json',
              frameRate: FrameRate(60),
              width: 160,
              repeat: false,
              onLoaded: (p0) {
                Future.delayed(Duration(seconds: 2), (){
                  context.go('/home');
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "You're successfully verified!",
              style: GoogleFonts.plusJakartaSans(
                textStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
