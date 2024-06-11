import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tic_tac_toe/features/game/data/game_repo/game_repo_impl.dart';
import 'package:tic_tac_toe/features/game/data/models/game_tile_mode.dart';

part 'game_board_state.dart';

class GameBoardCubit extends Cubit<GameBoardState> {
  GameBoardCubit(this.gameRepoImpl) : super(GameBoardInitial());

  final GameRepoImpl gameRepoImpl;

  List<GameTileModel> board = [
    GameTileModel(userName: "", isChecked: false, image: ""),
    GameTileModel(userName: "", isChecked: false, image: ""),
    GameTileModel(userName: "", isChecked: false, image: ""),
    GameTileModel(userName: "", isChecked: false, image: ""),
    GameTileModel(userName: "", isChecked: false, image: ""),
    GameTileModel(userName: "", isChecked: false, image: ""),
    GameTileModel(userName: "", isChecked: false, image: ""),
    GameTileModel(userName: "", isChecked: false, image: ""),
    GameTileModel(userName: "", isChecked: false, image: ""),
  ];

  List<int> chosenMoves = [];

  bool canPlay = true;
  bool gameEnds = false;

  void addPlayerMove({
    required int index,
    required GameTileModel tile,
  }) {
    gameRepoImpl.addPlayerMove(board: board, index: index, tile: tile);
    emit(GameBoardChanged());
  }

  void checkWinner({required List<GameTileModel> board}) {
    String winner = gameRepoImpl.checkWinner(board: board);
    if (winner != "") {
      gameEnds = true;
      emit(GameBoardFinished(winner: winner));
    }
  }

  void resetGame() {
    board = gameRepoImpl.resetGame();
    chosenMoves = [];
    canPlay = true;
    gameEnds = false;
    emit(GameBoardReset());
  }

  void checkDraw() {
    bool draw = gameRepoImpl.checkDraw(board: board);
    if (draw == true) {
      gameEnds = true;
      resetGame();
      emit(GameBoardDraw());
    }
  }
}
