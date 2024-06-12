import 'dart:math';

import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/game/data/models/game_tile_mode.dart';

int getBestMove(List<GameTileModel> board, List<int> chosenMoves,
    UserModel player1, UserModel player2) {
  int bestVal = -1000;
  int bestMove = -1;

  for (int i = 0; i < 9; i++) {
    if (!board[i].isChecked) {
      board[i].isChecked = true;
      board[i].userName = player2.userName;
      int moveVal = minimax(board, chosenMoves, 0, false, player1, player2);
      board[i].isChecked = false;
      board[i].userName = "";

      if (moveVal > bestVal) {
        bestMove = i;
        bestVal = moveVal;
      }
    }
  }
  return bestMove;
}

int minimax(List<GameTileModel> board, List<int> chosenMoves, int depth,
    bool isMax, UserModel player1, UserModel player2) {
  int score = evaluateBoard(board, player1, player2);

  if (score == 10 || score == -10) return score;
  if (!isMovesLeft(board)) return 0;

  if (isMax) {
    int best = -1000;
    for (int i = 0; i < 9; i++) {
      if (!board[i].isChecked) {
        board[i].isChecked = true;
        board[i].userName = player2.userName;
        best = max(best,
            minimax(board, chosenMoves, depth + 1, !isMax, player1, player2));
        board[i].isChecked = false;
        board[i].userName = "";
      }
    }
    return best;
  } else {
    int best = 1000;
    for (int i = 0; i < 9; i++) {
      if (!board[i].isChecked) {
        board[i].isChecked = true;
        board[i].userName = player1.userName;
        best = min(best,
            minimax(board, chosenMoves, depth + 1, !isMax, player1, player2));
        board[i].isChecked = false;
        board[i].userName = "";
      }
    }
    return best;
  }
}

int evaluateBoard(
    List<GameTileModel> board, UserModel player1, UserModel player2) {
  for (int row = 0; row < 3; row++) {
    if (board[row * 3].userName == board[row * 3 + 1].userName &&
        board[row * 3 + 1].userName == board[row * 3 + 2].userName &&
        board[row * 3].userName != "") {
      if (board[row * 3].userName == player2.userName) return 10;
      if (board[row * 3].userName == player1.userName) return -10;
    }
  }

  for (int col = 0; col < 3; col++) {
    if (board[col].userName == board[col + 3].userName &&
        board[col].userName == board[col + 6].userName &&
        board[col].userName != "") {
      if (board[col].userName == player2.userName) return 10;
      if (board[col].userName == player1.userName) return -10;
    }
  }

  if (board[0].userName == board[4].userName &&
      board[4].userName == board[8].userName &&
      board[0].userName != "") {
    if (board[0].userName == player2.userName) return 10;
    if (board[0].userName == player1.userName) return -10;
  }

  if (board[2].userName == board[4].userName &&
      board[4].userName == board[6].userName &&
      board[2].userName != "") {
    if (board[2].userName == player2.userName) return 10;
    if (board[2].userName == player1.userName) return -10;
  }

  return 0;
}

bool isMovesLeft(List<GameTileModel> board) {
  for (var tile in board) {
    if (!tile.isChecked) {
      return true;
    }
  }
  return false;
}
