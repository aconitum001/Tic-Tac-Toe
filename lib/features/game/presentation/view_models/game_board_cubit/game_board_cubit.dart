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

  bool first = true;
  List<int> chosenMoves = [];
  bool canPlay = true;
  bool gameEnds = false;
  int player1Score = 0;
  int player2Score = 0;

  void addPlayerMove({
    required int index,
    required GameTileModel tile,
  }) {
    gameRepoImpl.addPlayerMove(board: board, index: index, tile: tile);
    emit(GameBoardChanged());
  }

  void checkWinner({required List<GameTileModel> board}) {
    Map<String, dynamic> winnerInfo = gameRepoImpl.checkWinner(board: board);
    if (winnerInfo.isNotEmpty) {
      gameEnds = true;
      emit(
        GameBoardFinished(
          winner: winnerInfo["winnerName"],
          winningCombination: winnerInfo["winningCombination"],
        ),
      );
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
