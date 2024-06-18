import 'package:intl/intl.dart';
import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:tic_tac_toe/core/utils/constants.dart';
import 'package:tic_tac_toe/features/settings/data/models/game_history_model.dart';

part 'game_history_state.dart';

class GameHistoryCubit extends Cubit<GameHistoryState> {
  GameHistoryCubit() : super(GameHistoryInitial());

  Future<void> addGameHistory({
    required String player1UserName,
    required String player2UserName,
    required String player1Avatar,
    required String player2Avatar,
    required String player1Skin,
    required String player2Skin,
    required int player1Score,
    required int player2Score,
  }) async {
    var box = await Hive.openBox<GameHistoryModel>(kHistoryBox);
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('EEE, d MMMM | HH:mm');
    String formatted = formatter.format(now);
    GameHistoryModel gameHistory = GameHistoryModel(
      player1Avatar: player1Avatar,
      player1UserName: player1UserName,
      player1Skin: player1Skin,
      player1Score: player1Score,
      player2Avatar: player2Avatar,
      player2UserName: player2UserName,
      player2Skin: player2Skin,
      player2Score: player2Score,
      date: formatted,
    );
    box.add(gameHistory);
  }

  Future<void> getHistory() async {
    emit(GameHistoryLoading());
    var box = await Hive.openBox<GameHistoryModel>(kHistoryBox);
    List<GameHistoryModel> historyList = box.values.toList();
    emit(GameHistoryLoaded(historyList: historyList));
  }
}
