import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/functions/bot_functions.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/game/data/models/game_tile_mode.dart';
import 'package:tic_tac_toe/features/game/presentation/view_models/game_board_cubit/game_board_cubit.dart';

class GameBoardTile extends StatelessWidget {
  const GameBoardTile({
    super.key,
    required this.index,
    required this.player1,
    required this.player2,
    required this.player1SelectedSkin,
    required this.player2SelectedSkin,
    required this.dificulty,
  });

  final int index;
  final UserModel player1, player2;
  final String player1SelectedSkin, player2SelectedSkin;
  final String dificulty;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBoardCubit, GameBoardState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: BlocProvider.of<GameBoardCubit>(context).canPlay
              ? () async {
                  if (BlocProvider.of<GameBoardCubit>(context)
                          .board[index]
                          .isChecked ==
                      false) {
                    PlayerMove(context);

                    if (BlocProvider.of<GameBoardCubit>(context).gameEnds ==
                        false) {
                      BlocProvider.of<GameBoardCubit>(context).checkDraw();
                      botMove(context);
                      BlocProvider.of<GameBoardCubit>(context).canPlay = true;
                    }
                  }
                }
              : null,
          child: Container(
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: tileColor(state, context),
            ),
            child: tileWidget(context, state),
          ),
        );
      },
    );
  }

  Color tileColor(GameBoardState state, context) {
    return state is GameBoardFinished
        ? (state.winningCombination.contains(index)
            ? (state.winner == "Bot"
                ? const Color(0xffFF9C8E)
                : const Color(0xff97CE62))
            : Theme.of(context).colorScheme.surface)
        : Theme.of(context).colorScheme.surface;
  }

  SvgPicture? tileWidget(BuildContext context, GameBoardState state) {
    return BlocProvider.of<GameBoardCubit>(context).board[index].isChecked
        ? (state is GameBoardFinished
            ? (state.winningCombination.contains(index)
                ? (state.winner == "Bot"
                    ? SvgPicture.asset(AppAssets.oWin)
                    : SvgPicture.asset(AppAssets.xWin))
                : SvgPicture.asset(
                    BlocProvider.of<GameBoardCubit>(context).board[index].image,
                  ))
            : SvgPicture.asset(
                BlocProvider.of<GameBoardCubit>(context).board[index].image,
              ))
        : null;
  }

  void botMove(BuildContext context) {
    if (dificulty == "easy") {
      addBotMoveEasy(
        context,
        player1,
        player2,
        player2SelectedSkin,
      );
    } else if (dificulty == "medium") {
      addBotMoveMedium(
        context,
        player1,
        player2,
        player2SelectedSkin,
      );
    } else {
      addBotMoveHard(
        context,
        player1,
        player2,
        player2SelectedSkin,
      );
    }
    checkWinner(context);
  }

  void PlayerMove(BuildContext context) {
    addPlayerMove(context);
    checkWinner(context);
    BlocProvider.of<GameBoardCubit>(context).canPlay = false;
  }

  // methods

  void checkWinner(BuildContext context) {
    BlocProvider.of<GameBoardCubit>(context).checkWinner(
      board: BlocProvider.of<GameBoardCubit>(context).board,
    );
  }

  void addPlayerMove(BuildContext context) {
    GameTileModel tile = GameTileModel(
      userName: player1.userName,
      image: player1SelectedSkin,
      isChecked: true,
    );

    BlocProvider.of<GameBoardCubit>(context).chosenMoves.add(index);
    BlocProvider.of<GameBoardCubit>(context)
        .addPlayerMove(index: index, tile: tile);
  }
}
