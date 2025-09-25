import 'package:e_logistika/core/router/routers_name.dart';
import 'package:e_logistika/features/chat/presentation/page/chat_message_page.dart';
import 'package:e_logistika/features/creation/presentation/page/create_searce_page.dart';
import 'package:e_logistika/features/my_card/presentation/screens/my_card_screen.dart';
import 'package:e_logistika/features/navigation/navigation_page.dart';
import 'package:e_logistika/features/profile/presentation/page/biometrics_screen.dart';
import 'package:e_logistika/features/profile/presentation/page/devices_screen.dart';
import 'package:e_logistika/features/profile/presentation/page/my_orders/my_orders_page.dart';
import 'package:e_logistika/features/profile/presentation/page/pin_code_screen.dart';
import 'package:e_logistika/features/profile/presentation/page/profile_edit_page.dart';
import 'package:e_logistika/features/profile/presentation/page/settings_screen.dart';
import 'package:e_logistika/features/profile/presentation/page/wallet/done_page.dart';
import 'package:e_logistika/features/profile/presentation/page/wallet/recent_transactions.dart';
import 'package:e_logistika/features/profile/presentation/page/wallet/transfer_wallet_page.dart';
import 'package:e_logistika/features/profile/presentation/page/wallet/up_your_wallet_page.dart';
import 'package:e_logistika/features/profile/presentation/page/wallet/wallet_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../../features/chat/presentation/page/change_price_page.dart';
import '../../features/main/presentation/pages/main_page.dart';


class AppRouter {
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
  GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: '/',
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
              return const DevicesScreen();
            },
          ),

          GoRoute(
            path: RoutersName.createOrderPath,
            name: RoutersName.createOrderName,
            builder: (BuildContext context, GoRouterState state) {
              return const CreateOrderScreen();
            },
          ),
          GoRoute(
            path: RoutersName.walletPagePath,
            name: RoutersName.walletPageName,
            builder: (BuildContext context, GoRouterState state) {
              return const WalletPage();
            },
          ),
          GoRoute(
            path: RoutersName.transferWalletPagePath,
            name: RoutersName.transferWalletPageName,
            builder: (BuildContext context, GoRouterState state) {
              return const TransferWalletPage();
            },
          ),

          GoRoute(
            path: RoutersName.recentTransactionsPath,
            name: RoutersName.recentTransactionsName,
            builder: (BuildContext context, GoRouterState state) {
              return const RecentTransactions();
            },
          ),

          GoRoute(
            path: RoutersName.upYourWalletPath,
            name: RoutersName.upYourWalletName,
            builder: (BuildContext context, GoRouterState state) {
              return const UpYourWalletPage();
            },
          ),
          GoRoute(
            path: RoutersName.donePagePath,
            name: RoutersName.donePageName,
            builder: (BuildContext context, GoRouterState state) {
              return const DonePage();
            },
          ),
          GoRoute(
            path: RoutersName.profileEditPagePath,
            name: RoutersName.profileEditPageName,
            builder: (BuildContext context, GoRouterState state) {
              return const ProfileEditPage();
            },
          ),
          GoRoute(
            path: RoutersName.myOrdersPagePath,
            name: RoutersName.myOrdersPageName,
            builder: (BuildContext context, GoRouterState state) {
              return const MyOrdersPage();
            },
          ),
          GoRoute(
            path: RoutersName.chatMessagePagePath,
            name: RoutersName.chatMessagePageName,
            builder: (BuildContext context, GoRouterState state) {
              return const ChatMessagePage();
            },
          ),
          GoRoute(
            path: RoutersName.changePricePagePath,
            name: RoutersName.changePricePageName,
            builder: (BuildContext context, GoRouterState state) {
              return  ChangePricePage();
            },
          ),
        ],
      ),
    ],
  );
}