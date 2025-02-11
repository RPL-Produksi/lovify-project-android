import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/configs/app_colors.dart';
import 'package:lovify_android/ui/widgets/primary_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
          style: GoogleFonts.plusJakartaSans(
            textStyle: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: 'Email Address',
            prefixIcon: Icon(Icons.email_rounded),
            hintStyle: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          "Password",
          style: GoogleFonts.plusJakartaSans(
            textStyle: TextStyle(
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        TextField(
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: 'Password',
            prefixIcon: Icon(Icons.key_rounded),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              icon: Icon(
                _isPasswordVisible
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded,
              ),
            ),
            hintStyle: GoogleFonts.plusJakartaSans(
              textStyle: TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () {},
              child: Text(
                "Forgot password",
                style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: AppColors.deepRed,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 32,
        ),
        PrimaryButton(
          text: "Sign In",
          onPressed: () {},
          backgroundColor: AppColors.deepRed,
          textColor: Colors.white,
          width: double.infinity,
        ),
        SizedBox(
          height: 12,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't have an account? ",
              style: GoogleFonts.plusJakartaSans(
                textStyle: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.go('/register');
              },
              child: Text(
                "Sign up",
                style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.deepRed,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
