import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
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
  });

  final int index;
  final UserModel player1, player2;
  final String player1SelectedSkin, player2SelectedSkin;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GameBoardCubit, GameBoardState>(
      listener: (context, state) {
        if (state is GameBoardChanged) {
          changeCurrentPlayer(context);
        }
        if (state is GameBoardFinished) {
          print(state.winner);
        }
      },
      builder: (context, state) {
        initCurrentPlayer(state, context);
        return GestureDetector(
          onTap: () {
            addPlayerMove(context);
            checkWinner(context);
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

  // methods

  void initCurrentPlayer(GameBoardState state, BuildContext context) {
    if (state is GameBoardInitial) {
      BlocProvider.of<GameBoardCubit>(context).currentPlayer = player1;
      BlocProvider.of<GameBoardCubit>(context).currentPlayerSkin =
          player1SelectedSkin;
    }
  }

  void changeCurrentPlayer(BuildContext context) {
    if (BlocProvider.of<GameBoardCubit>(context).currentPlayer == player1) {
      BlocProvider.of<GameBoardCubit>(context).currentPlayer = player2;
      BlocProvider.of<GameBoardCubit>(context).currentPlayerSkin =
          player2SelectedSkin;
    } else {
      BlocProvider.of<GameBoardCubit>(context).currentPlayer = player1;
      BlocProvider.of<GameBoardCubit>(context).currentPlayerSkin =
          player1SelectedSkin;
    }
  }

  void checkWinner(BuildContext context) {
    BlocProvider.of<GameBoardCubit>(context).checkWinner(
      board: BlocProvider.of<GameBoardCubit>(context).board,
    );
  }

  void addPlayerMove(BuildContext context) {
    GameTileModel tile = GameTileModel(
      userName:
          BlocProvider.of<GameBoardCubit>(context).currentPlayer!.userName,
      image: BlocProvider.of<GameBoardCubit>(context).currentPlayerSkin!,
      isChecked: true,
    );
    BlocProvider.of<GameBoardCubit>(context)
        .addPlayerMove(index: index, tile: tile);
  }
}
