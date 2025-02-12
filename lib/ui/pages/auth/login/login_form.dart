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
  String? _emailError;
  String? _passwordError;

  bool _isLoading = false;

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

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
          keyboardType: TextInputType.emailAddress,
          autocorrect: false,
          controller: _emailController,
          focusNode: _emailFocus,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: 'Email Address',
            errorText: _emailError,
            errorStyle: TextStyle(fontSize: 10),
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
          controller: _passwordController,
          obscureText: !_isPasswordVisible,
          focusNode: _passwordFocus,
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => validateAndSubmit(),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: 'Password',
            errorText: _passwordError,
            errorStyle: TextStyle(fontSize: 10),
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
          text: _isLoading ? "Signing In...." : "Sign In",
          onPressed: () {
            if (_isLoading == false) {
              validateAndSubmit();
            }
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
              "Don't have an account? ",
              style: GoogleFonts.plusJakartaSans(
                textStyle: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.push('/register');
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

  void validateAndSubmit() async {
    setState(() {
      _emailError = _emailController.text.isEmpty
          ? "Please enter your email to continue"
          : (!isValidEmail(_emailController.text)
              ? "Make sure your email is correct (e.g., name@example.com)"
              : null);

      _passwordError = _passwordController.text.isEmpty
          ? "Please enter your password"
          : (_passwordController.text.length < 6
              ? "Your password should be at least 6 characters long"
              : null);
    });

    if (_emailError != null) {
      FocusScope.of(context).requestFocus(_emailFocus);
      return;
    }

    if (_passwordError != null) {
      FocusScope.of(context).requestFocus(_passwordFocus);
      return;
    }

    setState(() {
      _isLoading = true;
    });

    //ini loading ceritanya :)
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    context.go('/home');
  }
}

bool isValidEmail(String email) {
  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
  return emailRegex.hasMatch(email);
}
