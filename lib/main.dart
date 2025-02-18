import 'package:flutter/material.dart';
import 'package:lovify_android/util/manage_token.dart';

import 'configs/app_route.dart';
import 'configs/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    ManageToken.readToken();

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routerConfig: AppRoute.route,
    );
  }
}
