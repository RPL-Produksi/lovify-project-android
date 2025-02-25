import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lovify_android/configs/app_colors.dart';
import 'package:lovify_android/cubits/auth_cubit/auth_cubit.dart';
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

  final FocusNode _fullNameFocus = FocusNode();
  final FocusNode _usernameFocus = FocusNode();
  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _passwordConfirmFocus = FocusNode();

  String? _fullNameError;
  String? _usernameError;
  String? _phoneError;
  String? _emailError;
  String? _passwordError;
  String? _passwordConfirmError;

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _fullNameFocus.dispose();
    _usernameFocus.dispose();
    _phoneFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _passwordConfirmFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            context.go('/home');
          }
          if (state is RegisterError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.respond.message.toString(),
                  textAlign: TextAlign.center,
                ),
                duration: Duration(seconds: 2),
                backgroundColor: AppColors.deepRed,
              ),
            );
          }
        },
        builder: (context, state) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Full Name",
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
                controller: _fullNameController,
                focusNode: _fullNameFocus,
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
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              TextField(
                controller: _usernameController,
                focusNode: _usernameFocus,
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
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              TextField(
                controller: _phoneController,
                focusNode: _phoneFocus,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Phone Number',
                  prefixIcon: Icon(
                    Icons.phone,
                  ),
                  errorText: _phoneError,
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
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              TextField(
                controller: _emailController,
                focusNode: _emailFocus,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Email',
                  prefixIcon: Icon(
                    Icons.mail,
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
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              TextField(
                controller: _passwordController,
                focusNode: _passwordFocus,
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
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              TextField(
                controller: _passwordConfirmController,
                focusNode: _passwordConfirmFocus,
                obscureText: !_isPasswordVisible,
                textInputAction: TextInputAction.done,
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
              if (state is AuthLoading) ...[
                Center(
                  child: CircularProgressIndicator(
                    color: AppColors.deepRed,
                  ),
                )
              ] else ...[
                PrimaryButton(
                  text: "Sign Up",
                  onPressed: () {
                    validateAndSubmit(context);
                  },
                  backgroundColor: AppColors.deepRed,
                  textColor: Colors.white,
                  width: double.infinity,
                ),
              ],
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
                      context.pop();
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
              ),
            ],
          );
        },
      ),
    );
  }

  void validateAndSubmit(BuildContext context) {
    setState(() {
      _fullNameError =
          _fullNameController.text.isEmpty ? "Full name is required" : null;
      _usernameError =
          _usernameController.text.isEmpty ? "Username is required" : null;
      _phoneError =
          _phoneController.text.isEmpty ? "Phone number is required" : null;
      _passwordError =
          _passwordController.text.isEmpty ? "Password is required" : null;
      _emailError = _emailController.text.isEmpty
          ? "Please enter your email to continue"
          : (!EmailValidator.validate(_emailController.text.trim())
              ? "Make sure your email is correct (e.g., name@example.com)"
              : null);
      _passwordConfirmError = _passwordConfirmController.text.isEmpty
          ? "Password confirmation is required"
          : (_passwordConfirmController.text.trim() !=
                  _passwordController.text.trim()
              ? "Password not match"
              : null);
    });

    if (_fullNameError != null) {
      FocusScope.of(context).requestFocus(_fullNameFocus);
      return;
    }
    if (_usernameError != null) {
      FocusScope.of(context).requestFocus(_usernameFocus);
      return;
    }
    if (_phoneError != null) {
      FocusScope.of(context).requestFocus(_phoneFocus);
      return;
    }
    if (_emailError != null) {
      FocusScope.of(context).requestFocus(_emailFocus);
      return;
    }
    if (_passwordError != null) {
      FocusScope.of(context).requestFocus(_passwordFocus);
      return;
    }
    if (_passwordConfirmError != null) {
      FocusScope.of(context).requestFocus(_passwordConfirmFocus);
      return;
    }

    if (_fullNameError == null &&
        _usernameError == null &&
        _phoneError == null &&
        _emailError == null &&
        _passwordError == null &&
        _passwordConfirmError == null) {
      context.read<AuthCubit>().postRegister(
            fullname: _fullNameController.text.trim(),
            username: _usernameController.text.trim(),
            password: _passwordController.text.trim(),
            passwordConfirmation: _passwordConfirmController.text.trim(),
            email: _emailController.text.trim(),
            phoneNumber: _phoneController.text.trim(),
          );
    }
  }
}
