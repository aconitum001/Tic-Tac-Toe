import 'package:tic_tac_toe/features/game/data/models/game_tile_mode.dart';

abstract class GameRepo {
  void addPlayerMove({
    required List<GameTileModel> board,
    required int index,
    required GameTileModel tile,
  });

  Map<String, dynamic> checkWinner({
    required List<GameTileModel> board,
  });

  List<GameTileModel> resetGame();

  bool checkDraw({
    required List<GameTileModel> board,
  });
}
