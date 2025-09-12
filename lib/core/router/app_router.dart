import 'package:e_logistika/core/router/routers_name.dart';
import 'package:e_logistika/features/navigation/navigation_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/main/presentation/pages/main_page.dart';


class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
  GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey, // Add navigator key here
    initialLocation: '/', // Optional, for setting the initial route
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const MainPage();
        },
        routes: <RouteBase>[
          GoRoute(
            path: RoutersName.mainPath,
            name: RoutersName.mainName,
            builder: (BuildContext context, GoRouterState state) {
              return const NavigationPage();
            },
          ),
          GoRoute(
            path: RoutersName.navigationPath,
            name: RoutersName.navigationName,
            builder: (BuildContext context, GoRouterState state) {
              return const NavigationPage();
            },
          ),


        ],
      ),
    ],
  );
}