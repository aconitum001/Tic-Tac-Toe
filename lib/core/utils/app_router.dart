import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/create_user_view.dart';
import 'package:tic_tac_toe/features/game/presentation/views/game_view.dart';
import 'package:tic_tac_toe/features/home/presentation/views/home_view.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/settings_view.dart';
import 'package:tic_tac_toe/features/splash/presentation/views/get_started_view.dart';
import 'package:tic_tac_toe/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String kGetStartedView = "/getStarted";
  static const String kCreateUserView = "/createUserView";
  static const String kHomeView = "/homeView";
  static const String kSettingsView = "/settingsView";
  static const String kGameView = "/gameView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const Splashview(),
      ),
      GoRoute(
        path: kGetStartedView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 800),
          child: const GetStartedView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
              ),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kCreateUserView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 800),
          child: const CreateUserView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 800),
          child: const HomeView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
              ),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kSettingsView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 800),
          child: SettingsView(
            user: state.extra as UserModel,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
              ),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kGameView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 800),
          child: const GameView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
              ),
              child: child,
            );
          },
        ),
      ),
    ],
  );
}
