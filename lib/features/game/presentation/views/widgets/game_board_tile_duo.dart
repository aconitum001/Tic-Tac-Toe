import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/constants.dart';
import 'package:tic_tac_toe/core/utils/functions/get_o_color.dart';
import 'package:tic_tac_toe/core/utils/functions/get_x_color.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/game/data/models/game_tile_mode.dart';
import 'package:tic_tac_toe/features/game/presentation/view_models/game_board_cubit/game_board_cubit.dart';

class GameBoardTileDuo extends StatelessWidget {
  const GameBoardTileDuo({
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
    GameBoardCubit boardCubit = BlocProvider.of<GameBoardCubit>(context);

    return BlocConsumer<GameBoardCubit, GameBoardState>(
      listener: (context, state) {},
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (boardCubit.board[index].isChecked == false) {
              UserModel currentPlayer = boardCubit.currentPlayer ?? player1;
              String currentPlayerSlectedSkin =
                  boardCubit.currentPlayerSelectedSkin ?? player1SelectedSkin;
              playerMove(
                context,
                currentPlayer,
                currentPlayerSlectedSkin,
              );
              if (boardCubit.gameEnds == false) {
                boardCubit.checkDraw();
              }
              changePlayer(boardCubit);
            }
          },
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

  void changePlayer(GameBoardCubit boardCubit) {
    if (boardCubit.currentPlayer == player1) {
      boardCubit.currentPlayer = player2;
      boardCubit.currentPlayerSelectedSkin = player2SelectedSkin;
    } else if (boardCubit.currentPlayer == player2) {
      boardCubit.currentPlayer = player1;
      boardCubit.currentPlayerSelectedSkin = player1SelectedSkin;
    } else {
      boardCubit.currentPlayer = player2;
      boardCubit.currentPlayerSelectedSkin = player2SelectedSkin;
    }
  }

  Color tileColor(GameBoardState state, context) {
    if (state is GameBoardFinished) {
      return (state.winningCombination.contains(index)
          ? (state.winner == player1.userName
              ? (oLists.contains(player1SelectedSkin)
                  ? getOColor(oSkin: player1SelectedSkin)
                  : getXColor(xSkin: player1SelectedSkin))
              : (oLists.contains(player2SelectedSkin)
                  ? getOColor(oSkin: player2SelectedSkin)
                  : getXColor(xSkin: player2SelectedSkin)))
          : Theme.of(context).colorScheme.surface);
    } else {
      return Theme.of(context).colorScheme.surface;
    }
  }

  SvgPicture? tileWidget(BuildContext context, GameBoardState state) {
    if (BlocProvider.of<GameBoardCubit>(context).board[index].isChecked) {
      return (state is GameBoardFinished
          ? (state.winningCombination.contains(index)
              ? (state.winner == player1.userName
                  ? (oLists.contains(player1SelectedSkin)
                      ? SvgPicture.asset(AppAssets.oWin)
                      : SvgPicture.asset(AppAssets.xWin))
                  : (oLists.contains(player2SelectedSkin)
                      ? SvgPicture.asset(AppAssets.oWin)
                      : SvgPicture.asset(AppAssets.xWin)))
              : SvgPicture.asset(
                  BlocProvider.of<GameBoardCubit>(context).board[index].image,
                ))
          : SvgPicture.asset(
              BlocProvider.of<GameBoardCubit>(context).board[index].image,
            ));
    } else {
      return null;
    }
  }

  void playerMove(
    BuildContext context,
    UserModel player,
    String playerSelectedSkin,
  ) {
    addPlayerMove(context, player, playerSelectedSkin);
    checkWinner(context);
  }

  // methods
  void checkWinner(BuildContext context) {
    BlocProvider.of<GameBoardCubit>(context).checkWinner(
      board: BlocProvider.of<GameBoardCubit>(context).board,
    );
  }

  void addPlayerMove(
      BuildContext context, UserModel player, String playerSelectedSkin) {
    GameTileModel tile = GameTileModel(
      userName: player.userName,
      image: playerSelectedSkin,
      isChecked: true,
    );

    BlocProvider.of<GameBoardCubit>(context).chosenMoves.add(index);
    BlocProvider.of<GameBoardCubit>(context)
        .addPlayerMove(index: index, tile: tile);
  }
}
