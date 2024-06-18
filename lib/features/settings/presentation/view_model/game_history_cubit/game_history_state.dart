part of 'game_history_cubit.dart';

@immutable
sealed class GameHistoryState {}

final class GameHistoryInitial extends GameHistoryState {}

final class GameHistoryLoaded extends GameHistoryState {
  final List<GameHistoryModel> historyList;

  GameHistoryLoaded({required this.historyList});
}

final class GameHistoryLoading extends GameHistoryState {}
