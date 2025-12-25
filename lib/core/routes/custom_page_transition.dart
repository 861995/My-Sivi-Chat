import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum TransitionType { slideFromRight, fade }

CustomTransitionPage<T> buildPageWithTransition<T>({
  required Widget child,
  required String name,
  TransitionType transitionType = TransitionType.slideFromRight,
  Duration duration = const Duration(milliseconds: 300),
  Curve curve = Curves.easeInOut,
}) {
  return CustomTransitionPage<T>(
    child: child,
    name: name,
    transitionDuration: duration,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      switch (transitionType) {
        case TransitionType.fade:
          return FadeTransition(
            opacity: animation.drive(CurveTween(curve: curve)),
            child: child,
          );
        case TransitionType.slideFromRight:
          return SlideTransition(
            position: animation.drive(
              Tween<Offset>(
                begin: const Offset(1, 0),
                end: Offset.zero,
              ).chain(CurveTween(curve: curve)),
            ),
            child: child,
          );
      }
    },
  );
}
