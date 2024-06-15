import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
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
              if (boardCubit.currentPlayer == player1) {
                boardCubit.currentPlayer = player2;
                boardCubit.currentPlayerSelectedSkin = player2SelectedSkin;
              } else {
                boardCubit.currentPlayer = player1;
                boardCubit.currentPlayerSelectedSkin = player2SelectedSkin;
              }
            }
          },
          child: Container(
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: BlocProvider.of<GameBoardCubit>(context)
                    .board[index]
                    .isChecked
                ? SvgPicture.asset(
                    BlocProvider.of<GameBoardCubit>(context).board[index].image,
                  )
                : null,
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
