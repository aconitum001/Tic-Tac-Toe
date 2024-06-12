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

class GameViewBody extends StatefulWidget {
  const GameViewBody({
    super.key,
    required this.player1,
    required this.player2,
    required this.dificulty,
  });

  final UserModel player1, player2;
  final String dificulty;

  @override
  State<GameViewBody> createState() => _GameViewBodyState();
}

class _GameViewBodyState extends State<GameViewBody> {
  late ConfettiController controller;
  bool isInteractionDisabled = false;
  late ScrollController _scrollController;

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

  @override
  Widget build(BuildContext context) {
    currentPlayerName = widget.player1.userName;
    return BlocConsumer<GameBoardCubit, GameBoardState>(
      listener: (context, state) {
        if (state is GameBoardFinished) {
          Future.delayed(
            const Duration(milliseconds: 800),
            () {
              BlocProvider.of<GameBoardCubit>(context).resetGame();
              if (state.winner == widget.player1.userName) {
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
                setState(() {});
              }
            },
          );
        } else if (state is GameBoardDraw) {
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
        } else if (state is GameBoardChanged) {
          if (currentPlayerName == widget.player1.userName) {
            currentPlayerName = widget.player2.userName;
          } else {
            currentPlayerName = widget.player1.userName;
          }
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
              ),
              SizedBox(
                height: 40.h,
              ),
              const GameButtonsSection(),
            ],
          ),
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
