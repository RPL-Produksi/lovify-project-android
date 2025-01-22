import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
          ),
          Image.asset(
            "assets/images/lovify-logo.png",
            width: 100,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "Sign In to Your Account",
            style: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            "Email",
            style: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
