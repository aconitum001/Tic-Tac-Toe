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

  void addPlayerMove({
    required int index,
    required GameTileModel tile,
  }) {
    gameRepoImpl.addPlayerMove(board: board, index: index, tile: tile);
    print(board);
    emit(GameBoardChanged());
  }
}
