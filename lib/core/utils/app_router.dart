import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/create_user_view.dart';
import 'package:tic_tac_toe/features/game/presentation/views/challenges_view.dart';
import 'package:tic_tac_toe/features/game/presentation/views/chose_side_view.dart';
import 'package:tic_tac_toe/features/game/presentation/views/create_player_view.dart';
import 'package:tic_tac_toe/features/game/presentation/views/game_challenge_view.dart';
import 'package:tic_tac_toe/features/game/presentation/views/game_dificulty_view.dart';
import 'package:tic_tac_toe/features/game/presentation/views/game_duo_view.dart';
import 'package:tic_tac_toe/features/game/presentation/views/game_rules_view.dart';
import 'package:tic_tac_toe/features/game/presentation/views/game_bot_view.dart';
import 'package:tic_tac_toe/features/home/data/models/navigations_param_model.dart';
import 'package:tic_tac_toe/features/home/presentation/views/home_view.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/edit_profile_view.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/history_view.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/settings_view.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/skin_store_view.dart';
import 'package:tic_tac_toe/features/splash/presentation/views/get_started_view.dart';
import 'package:tic_tac_toe/features/splash/presentation/views/splash_view.dart';

abstract class AppRouter {
  static const String kGetStartedView = "/getStarted";
  static const String kCreateUserView = "/createUserView";
  static const String kHomeView = "/homeView";
  static const String kSettingsView = "/settingsView";
  static const String kGameView = "/gameView";
  static const String kGameRulesView = "/gameRulesView";
  static const String kGameDificultyView = "/gameDificultyView";
  static const String kGameDuoView = "/gameDuoView";
  static const String kCreatePlayerView = "/createPlayerView";
  static const String kChoseSideView = "/choseSideView";
  static const String kEditProfileView = "/editProfileView";
  static const String kSkinStoreView = "/skinstoreview";
  static const String kHistoryView = "/historyView";
  static const String kChallengesView = "/challengesView";
  static const String kGameChallengeView = "/gameChallengeView";

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
        pageBuilder: (context, state) {
          NavigationParams params = state.extra as NavigationParams;
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 800),
            child: GameBotView(
              player1: params.player1,
              player2: params.player2,
              dificulty: params.difficulty,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
          );
        },
      ),
      GoRoute(
        path: kGameRulesView,
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 800),
            child: const GameRulesView(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return ScaleTransition(
                scale: CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
                child: child,
              );
            },
          );
        },
      ),
      GoRoute(
        path: kGameDificultyView,
        pageBuilder: (context, state) {
          NavigationParams params = state.extra as NavigationParams;
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 800),
            child: GameDificultyView(
              player1: params.player1,
              player2: params.player2,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
          );
        },
      ),
      GoRoute(
          path: kGameDuoView,
          pageBuilder: (context, state) {
            NavigationParams params = state.extra as NavigationParams;
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 800),
              child: GameDuoView(
                player1: params.player1,
                player2: params.player2,
                selectedSkins: params.selectedSkins!,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
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
            );
          }),
      GoRoute(
        path: kCreatePlayerView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 800),
          child: CreatePlayerView(
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
        path: kChoseSideView,
        pageBuilder: (context, state) {
          NavigationParams params = state.extra as NavigationParams;
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 800),
            child: ChoseSideView(
              player1: params.player1,
              player2: params.player2,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
          );
        },
      ),
      GoRoute(
        path: kEditProfileView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 800),
          child: EditProfileView(
            user: state.extra as UserModel,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        ),
      ),
      GoRoute(
          path: kSkinStoreView,
          pageBuilder: (context, state) {
            NavigationParams params = state.extra as NavigationParams;
            return CustomTransitionPage(
              transitionDuration: const Duration(milliseconds: 800),
              child: SkinStoreView(
                user: params.player1,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return ScaleTransition(
                  scale: CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeInOut,
                  ),
                  child: child,
                );
              },
            );
          }),
      GoRoute(
        path: kHistoryView,
        pageBuilder: (context, state) => CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 800),
          child: HistoryView(
            user: state.extra as UserModel,
          ),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(
              scale: CurvedAnimation(
                parent: animation,
                curve: Curves.easeInOut,
              ),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kChallengesView,
        pageBuilder: (context, state) {
          NavigationParams params = state.extra as NavigationParams;
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 800),
            child: ChallengesView(
              player1: params.player1,
              player2: params.player2,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
          );
        },
      ),
      GoRoute(
        path: kGameChallengeView,
        pageBuilder: (context, state) {
          NavigationParams params = state.extra as NavigationParams;
          return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 800),
            child: GameChallengeView(
              player1: params.player1,
              player2: params.player2,
              challenge: params.challenge!,
            ),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
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
          );
        },
      ),
    ],
  );
}
