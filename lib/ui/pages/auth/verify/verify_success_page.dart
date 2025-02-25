import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VerifySuccessPage extends StatelessWidget {
  const VerifySuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "You're successfully verified!",
          style: GoogleFonts.plusJakartaSans(
            textStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
