part of 'game_board_cubit.dart';

@immutable
sealed class GameBoardState {}

final class GameBoardInitial extends GameBoardState {}

final class GameBoardChanged extends GameBoardState {}

final class GameBoardFinished extends GameBoardState {
  final String winner;

  GameBoardFinished({required this.winner});
}

final class GameBoardReset extends GameBoardState {}

final class GameBoardDraw extends GameBoardState {}
