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
}
