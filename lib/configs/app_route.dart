import 'package:go_router/go_router.dart';

import '../ui/pages/launch_page.dart';

class AppRoute {
  static final GoRouter route = GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      return null;
    },
    routes: _routes,
  );

  static List<RouteBase> get _routes => [
        GoRoute(
          path: '/',
          name: 'launch',
          builder: (context, state) => const LaunchPage(),
        ),
      ];
}
