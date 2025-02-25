import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/configs/app_colors.dart';
import 'package:lovify_android/ui/pages/auth/login/login_form.dart';
import 'package:lovify_android/ui/widgets/primary_button.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  String? _fullNameError;
  String? _usernameError;
  String? _phoneError;
  String? _emailError;
  String? _passwordError;
  String? _passwordConfirmError;

  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Full Name",
          style: GoogleFonts.plusJakartaSans(
            textStyle: TextStyle(
              color: AppColors.deepRed,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        TextField(
          controller: _fullNameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: 'Full Name',
            errorText: _fullNameError,
            prefixIcon: Icon(Icons.person),
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
          "Username",
          style: GoogleFonts.plusJakartaSans(
            textStyle: TextStyle(
              color: AppColors.deepRed,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: 'Username',
            errorText: _usernameError,
            prefixIcon: Icon(Icons.account_circle_rounded),
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
          "Phone Number",
          style: GoogleFonts.plusJakartaSans(
            textStyle: TextStyle(
              color: AppColors.deepRed,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        TextField(
          controller: _phoneController,
          keyboardType: TextInputType.phone,
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
          ],
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: 'Phone Number',
            errorText: _phoneError,
            prefixIcon: Icon(Icons.phone),
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
          "Email",
          style: GoogleFonts.plusJakartaSans(
            textStyle: TextStyle(
              color: AppColors.deepRed,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        TextField(
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: 'Email',
            prefixIcon: Icon(
              Icons.email,
            ),
            errorText: _emailError,
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
              color: AppColors.deepRed,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        TextField(
          controller: _passwordController,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: 'Password',
            errorText: _passwordError,
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
          height: 16,
        ),
        Text(
          "Password Confirmation",
          style: GoogleFonts.plusJakartaSans(
            textStyle: TextStyle(
              color: AppColors.deepRed,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        TextField(
          controller: _passwordConfirmController,
          obscureText: !_isPasswordVisible,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: 'Password Confirmation',
            errorText: _passwordConfirmError,
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
          height: 32,
        ),
        PrimaryButton(
          text: "Sign Up",
          onPressed: () {
            validateAndSubmit();
          },
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
              "Already have an account? ",
              style: GoogleFonts.plusJakartaSans(
                textStyle: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.push('/login');
              },
              child: Text(
                "Sign In",
                style: GoogleFonts.plusJakartaSans(
                  textStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF67191F),
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }

  void validateAndSubmit() {
    setState(() {
      _fullNameError =
          _fullNameController.text.isEmpty ? "Full name is required" : null;  
      _usernameError =
          _usernameController.text.isEmpty ? "Username is required" : null;
      _phoneError =
          _phoneController.text.isEmpty ? "Phone number is required" : null;
      _emailError = _emailController.text.isEmpty
          ? "Email is required"
          : (!isValidEmail(_emailController.text)
              ? "Make sure your email is correct (e.g., name@example.com)"
              : null);
      _passwordError =
          _passwordController.text.isEmpty ? "Password is required" : null;
      _passwordConfirmError = _passwordConfirmController.text.isEmpty
          ? "Password confirmation is required"
          : (_passwordController.text != _passwordConfirmController.text
              ? "Passwords do not match"
              : null);
    });

    if (_fullNameError == null &&
        _usernameError == null &&
        _phoneError == null &&
        _emailError == null &&
        _passwordError == null &&
        _passwordConfirmError == null) {
      context.go('/verify');
    }
  }
}
