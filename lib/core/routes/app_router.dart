import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_sivi_chat/core/routes/route_names.dart';

import '../custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import '../errors/fall_back_error_screen.dart';

final rootNavKey = GlobalKey<NavigatorState>();
final shellNavKey = GlobalKey<NavigatorState>();

class AppRouter {
  late final GoRouter router;

  AppRouter() {
    router = GoRouter(
      navigatorKey: rootNavKey,
      initialLocation: RouteNames.homeScreen,

      errorBuilder: (_, _) => const FallBackErrorScreen(),
      routes: [
        ShellRoute(
          navigatorKey: shellNavKey,
          builder: (_, _, child) => CustomBottomNavigationBar(child: child),
          routes: buildBottomNavScreens(),
        ),
      ],
    );
  }

  //Screens mentioned will be in bottom nav bar
  static List<RouteBase> buildBottomNavScreens() {
    return [
      GoRoute(
        path: RouteNames.homeScreen,
        name: RouteNames.homeScreen,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          name: RouteNames.homeScreen,
          child: const SizedBox(),
        ),
      ),
      GoRoute(
        path: RouteNames.otherScreen,
        name: RouteNames.otherScreen,
        pageBuilder: (context, state) {
          return NoTransitionPage(
            name: RouteNames.otherScreen,
            key: state.pageKey,
            child: const SizedBox(),
          );
        },
      ),

      GoRoute(
        path: RouteNames.settingScreen,
        name: RouteNames.settingScreen,
        pageBuilder: (context, state) => NoTransitionPage(
          key: state.pageKey,
          name: RouteNames.settingScreen,
          child: const SizedBox(),
        ),
      ),
    ];
  }
}
