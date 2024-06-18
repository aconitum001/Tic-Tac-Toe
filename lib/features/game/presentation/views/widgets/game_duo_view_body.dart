import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/functions/show_win_dialog.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/game/presentation/view_models/game_board_cubit/game_board_cubit.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/custom_game_view_appbar.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/display_players_info_section.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_board_section.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_buttons_section.dart';
import 'package:tic_tac_toe/features/settings/presentation/view_model/game_history_cubit/game_history_cubit.dart';

class GameDuoViewBody extends StatefulWidget {
  const GameDuoViewBody({
    super.key,
    required this.player1,
    required this.player2,
    required this.selectedSkins,
  });

  final UserModel player1, player2;
  final List<String> selectedSkins;

  @override
  State<GameDuoViewBody> createState() => _GameDuoViewBodyState();
}

class _GameDuoViewBodyState extends State<GameDuoViewBody> {
  late ConfettiController controller;
  bool isInteractionDisabled = false;
  late ScrollController _scrollController;

  int player1Score = 0, player2Score = 0;
  late String currentPlayerName;
  bool hasSavedHistory = false;

  @override
  void initState() {
    super.initState();
    controller = ConfettiController(duration: const Duration(seconds: 2));
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
    currentPlayerName =
        BlocProvider.of<GameBoardCubit>(context).currentPlayer?.userName ??
            widget.player1.userName;
  }

  @override
  void dispose() {
    controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            _handleGameFinished(state);
          } else if (state is GameBoardDraw) {
            _handleGameDraw();
          } else if (state is GameBoardChanged) {
            _handleGameChanged();
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is GameBoardFinished ? true : false,
            child: ListView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              children: [
                const CustomGameViewAppBar(),
                Text(
                  "$currentPlayerName's Turn",
                  style: AppStyles.style25,
                  textAlign: TextAlign.center,
                ),
                DisplayPlayersInfoSection(
                  selectedSkins: widget.selectedSkins,
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
                  dificulty: "easy",
                  gameMode: "duo",
                  selectedSkins: widget.selectedSkins,
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

  void _handleGameFinished(GameBoardFinished state) {
    Future.delayed(
      const Duration(milliseconds: 800),
      () {
        BlocProvider.of<GameBoardCubit>(context).resetGame();
        if (state.winner == widget.player1.userName) {
          showGameResults(
            context,
            controller,
            "${state.winner} Win!",
            const Color(0xffFF9900),
            const Color(0xff1A2B63),
            "assets/animations/winner.json",
            false,
            true,
          );
          player1Score++;
        } else {
          showGameResults(
            context,
            controller,
            "${state.winner} Win!",
            const Color(0xffFF9900),
            const Color(0xff1A2B63),
            "assets/animations/winner.json",
            false,
            true,
          );
          player2Score++;
        }
        setState(() {});
      },
    );
  }

  void _handleGameDraw() {
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

  void _handleGameChanged() {
    if (currentPlayerName == widget.player1.userName) {
      currentPlayerName = widget.player2.userName;
    } else {
      currentPlayerName = widget.player1.userName;
    }
  }

  void _saveGameHistory() {
    if (!hasSavedHistory) {
      BlocProvider.of<GameHistoryCubit>(context).addGameHistory(
        player1UserName: widget.player1.userName,
        player2UserName: widget.player2.userName,
        player1Avatar: widget.player1.avatar,
        player2Avatar: widget.player2.avatar,
        player1Skin: widget.selectedSkins[0],
        player2Skin: widget.selectedSkins[1],
        player1Score: player1Score,
        player2Score: player2Score,
      );
      hasSavedHistory = true;
    }
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }
}
