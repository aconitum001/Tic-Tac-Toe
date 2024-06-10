part of 'game_board_cubit.dart';

@immutable
sealed class GameBoardState {}

final class GameBoardInitial extends GameBoardState {}

final class GameBoardChanged extends GameBoardState {}
