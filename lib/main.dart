import 'package:flutter/material.dart';

import 'configs/app_route.dart';
import 'configs/app_theme.dart';
// import 'service/api/api_controller.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      routerConfig: AppRoute.route,
    );
  }
}
