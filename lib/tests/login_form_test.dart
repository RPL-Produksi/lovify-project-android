import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lovify_android/ui/pages/auth/login/login_form.dart';


void main() {
  testWidgets('Validasi input email & password', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: LoginForm())));

    // Cari input field email & password
    final emailField = find.byType(TextField).first;
    final passwordField = find.byType(TextField).last;
    final signInButton = find.text("Sign In");

    // Tekan tombol sign in tanpa input
    await tester.tap(signInButton);
    await tester.pump();

    // Pastikan error muncul
    expect(find.text("Please enter your email to continue"), findsOneWidget);
    expect(find.text("Please enter your password"), findsOneWidget);

    // Masukkan email salah
    await tester.enterText(emailField, "invalidemail");
    await tester.pump();
    expect(find.text("Make sure your email is correct (e.g., name@example.com)"), findsOneWidget);

    // Masukkan password kurang dari 6 karakter
    await tester.enterText(passwordField, "123");
    await tester.pump();
    expect(find.text("Your password should be at least 6 characters long"), findsOneWidget);
  });

  testWidgets('Password visibility toggle', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: LoginForm())));

    final visibilityToggle = find.byIcon(Icons.visibility_off_rounded);
    expect(visibilityToggle, findsOneWidget);

    await tester.tap(visibilityToggle);
    await tester.pump();

    expect(find.byIcon(Icons.visibility_rounded), findsOneWidget);
  });
}
