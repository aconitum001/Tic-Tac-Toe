import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/functions/show_win_dialog.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/game/data/models/challenge_model.dart';
import 'package:tic_tac_toe/features/game/presentation/view_models/game_board_cubit/game_board_cubit.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/custom_game_challenge_app_bar.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/display_players_info_section.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_board_section.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_buttons_section.dart';
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
  late ScrollController _scrollController;
  bool hasSavedHistory = false;
  int counter = 1;

  @override
  void initState() {
    super.initState();
    controller = ConfettiController(duration: const Duration(seconds: 2));
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    _scrollController.dispose();
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
              controller: _scrollController,
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
                const GameButtonsSection(),
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
    BlocProvider.of<UserCubit>(context).addUserDraws(user: widget.player1);
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
            BlocProvider.of<UserCubit>(context)
                .addUserWins(user: widget.player1);
          } else {
            challengeWinMethode(context);
          }
        } else {
          counter = 0;

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
          BlocProvider.of<UserCubit>(context)
              .addUserLoses(user: widget.player1);
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
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "Congratulation!",
              style: AppStyles.style30.copyWith(
                color: const Color(0xffFC7E63),
              ),
            ),
          ),
          content: SizedBox(
            height: 80.h,
            child: Column(
              children: [
                Text(
                  widget.challenge.reward.toString(),
                  style: AppStyles.style30.copyWith(
                    color: const Color(0xffFC7E63),
                    height: 0.8.h,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  "Points",
                  style: AppStyles.style30.copyWith(
                    color: const Color(0xffFC7E63),
                    height: 0.8.h,
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
                    fixedSize: Size(120.w, 29.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20.r,
                      ),
                    ),
                    backgroundColor: const Color(0xffFC7E63),
                  ),
                  onPressed: () {
                    GoRouter.of(context).pop();
                    GoRouter.of(context).pop();
                  },
                  child: Center(
                    child: Text(
                      'Next Challenge',
                      style: AppStyles.style14.copyWith(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
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

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
