import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/configs/app_colors.dart';
import 'package:lovify_android/ui/widgets/primary_button.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            Image.asset(
              "assets/images/lovify-logo.png",
              width: 100,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Verify Your Account",
              style: GoogleFonts.plusJakartaSans(
                textStyle: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 45,
            ),
            Text(
              'One more step!',
              style: GoogleFonts.plusJakartaSans(
                textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: AppColors.deepRed),
              ),
            ),
            Text.rich(
              TextSpan(
                  text: "We've sent a verification link to your ",
                  children: [
                    TextSpan(
                      text: 'email',
                      style: TextStyle(color: AppColors.deepRed),
                    ),
                    TextSpan(text: ' and '),
                    TextSpan(
                        text: 'WhatsApp',
                        style: TextStyle(color: AppColors.deepRed))
                  ]),
              style: GoogleFonts.plusJakartaSans(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Click the link in either message to activate your account. If you don’t see the message, check your spam folder or resend the verification.',
              style: GoogleFonts.plusJakartaSans(
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      spreadRadius: 1, // Spread of the shadow
                      blurRadius: 5, // Blur effect
                      offset: Offset(3, 3), // X & Y axis shadow position
                    ),
                  ], borderRadius: BorderRadius.circular(12)),
                  child: PrimaryButton(
                    text: 'Resend link',
                    onPressed: () {},
                    width: 140,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2), // Shadow color
                      spreadRadius: 1, // Spread of the shadow
                      blurRadius: 5, // Blur effect
                      offset: Offset(3, 3), // X & Y axis shadow position
                    ),
                  ], borderRadius: BorderRadius.circular(12)),
                  child: PrimaryButton(
                    text: 'Next',
                    onPressed: () {
                      context.go('/verifySuccess');
                    },
                    backgroundColor: AppColors.deepRed,
                    textColor: AppColors.whiteSmoke,
                    width: 140,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
