import 'package:tic_tac_toe/features/game/data/game_repo/game_repo.dart';
import 'package:tic_tac_toe/features/game/data/models/game_tile_mode.dart';

class GameRepoImpl implements GameRepo {
  @override
  void addPlayerMove({
    required List<GameTileModel> board,
    required int index,
    required GameTileModel tile,
  }) {
    board[index] = tile;
  }

  @override
  String checkWinner({required List<GameTileModel> board}) {
    const List<List<int>> winningCombinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ];

    for (var combination in winningCombinations) {
      int a = combination[0];
      int b = combination[1];
      int c = combination[2];

      if (board[a].isChecked &&
          board[a].userName == board[b].userName &&
          board[a].userName == board[c].userName) {
        return board[a].userName;
      }
    }

    return '';
  }
}
