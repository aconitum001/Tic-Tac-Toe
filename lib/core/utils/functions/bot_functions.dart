import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/core/utils/functions/min_max_alogirthme.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/game/data/models/game_tile_mode.dart';
import 'package:tic_tac_toe/features/game/presentation/view_models/game_board_cubit/game_board_cubit.dart';

void addBotMoveEasy(
  BuildContext context,
  UserModel player1,
  UserModel player2,
  String player2SelectedSkin,
) {
  GameBoardCubit cubit = BlocProvider.of<GameBoardCubit>(context);
  Random random = Random();

  double probabilityOfRandomMove = 0.5;

  int bestMove;
  if (random.nextDouble() < probabilityOfRandomMove) {
    do {
      bestMove = random.nextInt(9);
    } while (cubit.board[bestMove].isChecked);
  } else {
    bestMove = getBestMove(cubit.board, cubit.chosenMoves, player1, player2);
  }

  GameTileModel tile = GameTileModel(
    userName: player2.userName,
    image: player2SelectedSkin,
    isChecked: true,
  );

  cubit.chosenMoves.add(bestMove);
  cubit.addPlayerMove(index: bestMove, tile: tile);
}

void addBotMoveMedium(
  BuildContext context,
  UserModel player1,
  UserModel player2,
  String player2SelectedSkin,
) {
  GameBoardCubit cubit = BlocProvider.of<GameBoardCubit>(context);
  Random random = Random();

  double probabilityOfRandomMove =
      0.2; // 40% of the time the bot makes a random move

  int bestMove;
  if (random.nextDouble() < probabilityOfRandomMove) {
    do {
      bestMove = random.nextInt(9);
    } while (cubit.board[bestMove].isChecked);
  } else {
    bestMove = getBestMove(cubit.board, cubit.chosenMoves, player1, player2);
  }

  GameTileModel tile = GameTileModel(
    userName: player2.userName,
    image: player2SelectedSkin,
    isChecked: true,
  );

  cubit.chosenMoves.add(bestMove);
  cubit.addPlayerMove(index: bestMove, tile: tile);
}

void addBotMoveHard(
  BuildContext context,
  UserModel player1,
  UserModel player2,
  String player2SelectedSkin,
) {
  GameBoardCubit cubit = BlocProvider.of<GameBoardCubit>(context);
  Random random = Random();

  double probabilityOfRandomMove = 0.1;

  int bestMove;
  if (random.nextDouble() < probabilityOfRandomMove) {
    do {
      bestMove = random.nextInt(9);
    } while (cubit.board[bestMove].isChecked);
  } else {
    bestMove = getBestMove(cubit.board, cubit.chosenMoves, player1, player2);
  }

  GameTileModel tile = GameTileModel(
    userName: player2.userName,
    image: player2SelectedSkin,
    isChecked: true,
  );

  cubit.chosenMoves.add(bestMove);
  cubit.addPlayerMove(index: bestMove, tile: tile);
}
