import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe/core/utils/functions/show_win_dialog.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/game/data/models/challenge_model.dart';
import 'package:tic_tac_toe/features/game/presentation/view_models/game_board_cubit/game_board_cubit.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/custom_game_challenge_app_bar.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/display_players_info_section.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_board_section.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_challenge_buttons_section.dart';
import 'package:tic_tac_toe/features/home/presentation/view_model/user_cubit/user_cubit.dart';

class GameChallengeViewBody extends StatefulWidget {
  const GameChallengeViewBody({
    super.key,
    required this.player1,
    required this.player2,
    required this.challenge,
  });

  final UserModel player1, player2;
  final ChallengeModel challenge;

  @override
  State<GameChallengeViewBody> createState() => _GameChallengeViewBodyState();
}

class _GameChallengeViewBodyState extends State<GameChallengeViewBody> {
  late ConfettiController controller;
  bool isInteractionDisabled = false;

  bool hasSavedHistory = false;
  int counter = 1;

  @override
  void initState() {
    super.initState();
    controller = ConfettiController(duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  int player1Score = 0, player2Score = 0;
  late String currentPlayerName;
  late int points;

  @override
  Widget build(BuildContext context) {
    currentPlayerName = widget.player1.userName;
    return PopScope(
      onPopInvoked: (didPop) {
        BlocProvider.of<GameBoardCubit>(context).currentPlayer = null;
        BlocProvider.of<GameBoardCubit>(context).currentPlayerSelectedSkin =
            null;
      },
      child: BlocConsumer<GameBoardCubit, GameBoardState>(
        listener: (context, state) {
          if (state is GameBoardFinished) {
            handleGameFinished(context, state);
          } else if (state is GameBoardDraw) {
            handleGameDraw(context);
          } else if (state is GameBoardChanged) {
            updatePlayerName();
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is GameBoardFinished ? true : false,
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                CustomGameChallengeAppBar(
                  challenge: widget.challenge,
                  counter: counter,
                ),
                Text(
                  "$currentPlayerName's Turn",
                  style: AppStyles.style25,
                  textAlign: TextAlign.center,
                ),
                DisplayPlayersInfoSection(
                  selectedSkins: widget.player1.selectedSkin,
                  player1: widget.player1,
                  player2: widget.player2,
                  player1Points: player1Score,
                  player2Points: player2Score,
                ),
                SizedBox(
                  height: 20.h,
                ),
                GameBoardSection(
                  player1: widget.player1,
                  player2: widget.player2,
                  dificulty: widget.challenge.difficulty,
                  gameMode: "solo",
                  selectedSkins: widget.player1.selectedSkin,
                ),
                SizedBox(
                  height: 40.h,
                ),
                const GameChallengeButtonsSection(),
              ],
            ),
          );
        },
      ),
    );
  }

  void updatePlayerName() {
    if (currentPlayerName == widget.player1.userName) {
      currentPlayerName = widget.player2.userName;
    } else {
      currentPlayerName = widget.player1.userName;
    }
  }

  void handleGameDraw(BuildContext context) {
    BlocProvider.of<GameBoardCubit>(context).resetGame();
    showGameResults(
      context,
      controller,
      "Draw!",
      Theme.of(context).colorScheme.onPrimary,
      Colors.transparent,
      "assets/animations/draww.json",
      true,
      false,
    );
  }

  void handleGameFinished(BuildContext context, GameBoardFinished state) {
    Future.delayed(
      const Duration(milliseconds: 800),
      () {
        BlocProvider.of<GameBoardCubit>(context).resetGame();
        if (state.winner == widget.player1.userName) {
          counter++;
          if (counter <= widget.challenge.rounds) {
            showGameResults(
              context,
              controller,
              "You Win!",
              const Color(0xffFF9900),
              const Color(0xff1A2B63),
              "assets/animations/winner.json",
              false,
              true,
            );
            player1Score++;
            setState(() {});
          } else {
            challengeWinMethode(context);
          }
        } else {
          counter = 1;
          showGameResults(
            context,
            controller,
            "You Lose!",
            const Color(0xffFF3F05),
            Colors.transparent,
            "assets/animations/angry_v2.json",
            false,
            false,
          );
          player2Score++;
          player1Score = 0;
          player2Score = 0;
          setState(() {});
        }
      },
    );
  }

  void challengeWinMethode(BuildContext context) {
    BlocProvider.of<UserCubit>(context).updateUserPoints(
      points: widget.challenge.reward,
      user: widget.player1,
    );
    widget.player1.challengesFinished.add(widget.challenge.id);
    widget.player1.unlockedChallenges.add(widget.challenge.id + 1);
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: Colors.white,
          content: SizedBox(
            height: 343.h,
            child: Stack(
              children: [
                Lottie.asset(
                  "assets/animations/challenge.json",
                  repeat: false,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.challenge.reward.toString(),
                        style: AppStyles.style30.copyWith(
                          color: Colors.orange,
                          height: 1.h,
                        ),
                      ),
                      Text(
                        "points",
                        style: AppStyles.style30.copyWith(
                          color: Colors.orange,
                          height: 1.h,
                        ),
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20.r,
                      ),
                    ),
                    backgroundColor: Colors.orange,
                  ),
                  onPressed: () {
                    GoRouter.of(context).pop();
                    GoRouter.of(context).pop();
                    BlocProvider.of<UserCubit>(context).showReward();
                  },
                  child: Text(
                    'Next Challenge',
                    style: AppStyles.style14.copyWith(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
