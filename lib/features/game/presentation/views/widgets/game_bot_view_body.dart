import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe/core/utils/app_router.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/constants.dart';
import 'package:tic_tac_toe/core/utils/functions/show_win_dialog.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/game/presentation/view_models/game_board_cubit/game_board_cubit.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/custom_game_view_appbar.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/display_players_info_section.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_board_section.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_buttons_section.dart';
import 'package:tic_tac_toe/features/home/presentation/view_model/user_cubit/user_cubit.dart';
import 'package:tic_tac_toe/features/settings/presentation/view_model/game_history_cubit/game_history_cubit.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/skin_store_view.dart';

class GameBotViewBody extends StatefulWidget {
  const GameBotViewBody({
    super.key,
    required this.player1,
    required this.player2,
    required this.dificulty,
  });

  final UserModel player1, player2;
  final String dificulty;

  @override
  State<GameBotViewBody> createState() => _GameBotViewBodyState();
}

class _GameBotViewBodyState extends State<GameBotViewBody> {
  late ConfettiController controller;
  bool isInteractionDisabled = false;
  late ScrollController _scrollController;
  bool hasSavedHistory = false;

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
        _saveGameHistory();
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
                CustomGameViewAppBar(
                  player: widget.player1,
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
                  dificulty: widget.dificulty,
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
          if (widget.dificulty == "easy") {
            points = winPointsEasy;
          } else if (widget.dificulty == "medium") {
            points = winPointsMedium;
          } else {
            points = winPointsHard;
          }
          BlocProvider.of<UserCubit>(context)
              .updateUserPoints(points: points, user: widget.player1);
          BlocProvider.of<UserCubit>(context).addUserWins(user: widget.player1);
          if (widget.player1.points >= 100 &&
              !widget.player1.unlockedSkins.contains(1)) {
            widget.player1.unlockedSkins.add(1);
            giftMethode(context);
          } else if (widget.player1.points >= 200 &&
              !widget.player1.unlockedSkins.contains(2)) {
            widget.player1.unlockedSkins.add(2);
            giftMethode(context);
          } else if (widget.player1.points >= 300 &&
              !widget.player1.unlockedSkins.contains(3)) {
            widget.player1.unlockedSkins.add(3);
            giftMethode(context);
          } else if (widget.player1.points >= 400 &&
              !widget.player1.unlockedSkins.contains(4)) {
            widget.player1.unlockedSkins.add(4);
            giftMethode(context);
          } else if (widget.player1.points >= 500 &&
              !widget.player1.unlockedSkins.contains(5)) {
            widget.player1.unlockedSkins.add(5);
            giftMethode(context);
          } else if (widget.player1.points >= 600 &&
              !widget.player1.unlockedSkins.contains(6)) {
            widget.player1.unlockedSkins.add(6);
            giftMethode(context);
          } else if (widget.player1.points >= 700 &&
              !widget.player1.unlockedSkins.contains(7)) {
            widget.player1.unlockedSkins.add(7);
            giftMethode(context);
          } else if (widget.player1.points >= 800 &&
              !widget.player1.unlockedSkins.contains(8)) {
            widget.player1.unlockedSkins.add(8);
            giftMethode(context);
          } else {
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
          }
        } else {
          showGameResults(
            context,
            controller,
            "You Lose!",
            const Color(0xffFF3F05),
            Colors.transparent,
            "assets/animations/red_emoji.json",
            false,
            false,
          );
          player2Score++;
          setState(() {});
          if (widget.dificulty == "easy") {
            points = losePointsEasy;
          } else if (widget.dificulty == "medium") {
            points = losePointsMedium;
          } else {
            points = losePointsHard;
          }
          BlocProvider.of<UserCubit>(context)
              .updateUserPoints(points: points, user: widget.player1);
          BlocProvider.of<UserCubit>(context)
              .addUserLoses(user: widget.player1);
        }
      },
    );
  }

  void giftMethode(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          title: Center(
            child: Text(
              "Your New skin!",
              style: AppStyles.style25.copyWith(
                color: const Color(0xffF9BC05),
              ),
            ),
          ),
          content: Container(
            child: Lottie.asset(
              "assets/animations/gift.json",
              repeat: true,
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
                    backgroundColor: const Color(0xffFFBF00),
                  ),
                  onPressed: () {
                    GoRouter.of(context).pop();
                    GoRouter.of(context)
                        .push(AppRouter.kSkinStoreView, extra: widget.player1);
                  },
                  child: Text(
                    'Claim your skin',
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

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void _saveGameHistory() {
    if (!hasSavedHistory) {
      BlocProvider.of<GameHistoryCubit>(context).addGameHistory(
        player1UserName: widget.player1.userName,
        player2UserName: widget.player2.userName,
        player1Avatar: widget.player1.avatar,
        player2Avatar: widget.player2.avatar,
        player1Skin: widget.player1.selectedSkin[0],
        player2Skin: widget.player2.selectedSkin[1],
        player1Score: player1Score,
        player2Score: player2Score,
      );
      hasSavedHistory = true;
    }
  }
}
