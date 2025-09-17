import 'package:e_logistika/core/router/routers_name.dart';
import 'package:e_logistika/features/creation/presentation/page/creation_page/creation_map_page.dart';
import 'package:e_logistika/features/my_card/presentation/screens/my_card_screen.dart';
import 'package:e_logistika/features/navigation/navigation_page.dart';
import 'package:e_logistika/features/profile/presentation/page/biometrics_screen.dart';
import 'package:e_logistika/features/profile/presentation/page/pin_code_screen.dart';
import 'package:e_logistika/features/profile/presentation/page/settings_screen.dart';
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
          GoRoute(
            path: '/creation_map_page:pageIndex',
            name: RoutersName.creationName,
            builder: (context, state) {
              final pageIndex = state.pathParameters['pageIndex'];
              return NavigationPage(pageIndex: pageIndex);
            },
          ),
          GoRoute(
            path: RoutersName.myCardPath,
            name: RoutersName.myCardName,
            builder: (BuildContext context, GoRouterState state) {
              return const MyCardScreen();
            },
          ),
          GoRoute(
            path: RoutersName.settingPath,
            name: RoutersName.settingName,
            builder: (BuildContext context, GoRouterState state) {
              return const SettingsScreen();
            },
          ),
          GoRoute(
            path: RoutersName.biometricsPath,
            name: RoutersName.biometricsName,
            builder: (BuildContext context, GoRouterState state) {
              return const BiometricsScreen();
            },
          ),
          GoRoute(
            path: RoutersName.changePinCodePath,
            name: RoutersName.changePinCodeName,
            builder: (BuildContext context, GoRouterState state) {
              return const ChangePinCodeScreen();
            },
          ),

          GoRoute(
            path: RoutersName.devicesPath,
            name: RoutersName.devicesName,
            builder: (BuildContext context, GoRouterState state) {
              return const ChangePinCodeScreen();
            },
          ),


        ],
      ),
    ],
  );
}