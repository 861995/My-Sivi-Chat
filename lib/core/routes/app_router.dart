import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_sivi_chat/core/routes/route_names.dart';

import '../../chat_screen/domain/repository/chat_message_repo.dart';
import '../../chat_screen/domain/usecase/chat_message_usecase.dart';
import '../../chat_screen/presentation/Bloc/bloc/chat_msg_bloc.dart';
import '../../chat_screen/presentation/Bloc/event/chat_msg_event.dart';
import '../../chat_screen/presentation/screen/chat_message_screen.dart';
import '../../home_screen/presentation/screen/home_screen.dart';
import '../custom_bottom_navigation_bar/custom_bottom_navigation_bar.dart';
import '../errors/fall_back_error_screen.dart';
import '../injection/injection_container.dart';
import 'custom_page_transition.dart';

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

        GoRoute(
          path: RouteNames.chatScreen,
          name: RouteNames.chatScreen,
          pageBuilder: (context, state) {
            final params = state.extra as List;
            final String name = params[0] as String;
            final String lastSeen = params[1] as String;
            return buildPageWithTransition(
              name: RouteNames.chatScreen,
              child: BlocProvider(
                create: (context) => ChatMessageBloc(
                  fetchChatMessageUseCase: GetChatMessageUseCase(
                    getIt<ChatMessageRepository>(),
                  ),
                )..add(const FetchChatMessages()),
                child: ChatMessageScreen(name: name, lastSeen: lastSeen),
              ),
              transitionType: TransitionType.slideFromRight,
            );
          },
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
          child: const HomeScreen(),
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
