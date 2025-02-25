import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/ui/pages/auth/register/register_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: ListView(
          children: [
            SizedBox(
              height: 60,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                "assets/images/lovify-logo.png",
                width: 100,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Sign Up to Make Account",
              style: GoogleFonts.plusJakartaSans(
                textStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RegisterForm(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
