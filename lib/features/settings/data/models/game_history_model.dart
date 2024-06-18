import 'package:hive/hive.dart';

part 'game_history_model.g.dart';

@HiveType(typeId: 2)
class GameHistoryModel {
  @HiveField(0)
  final String player1Avatar;
  @HiveField(1)
  final String player1UserName;
  @HiveField(2)
  final String player1Skin;
  @HiveField(3)
  final int player1Score;
  @HiveField(4)
  final String player2Avatar;
  @HiveField(5)
  final String player2UserName;
  @HiveField(6)
  final String player2Skin;
  @HiveField(7)
  final int player2Score;
  @HiveField(8)
  final String day;
  @HiveField(9)
  final String month;
  @HiveField(10)
  final String year;

  GameHistoryModel({
    required this.player1Avatar,
    required this.player1UserName,
    required this.player1Skin,
    required this.player1Score,
    required this.player2Avatar,
    required this.player2UserName,
    required this.player2Skin,
    required this.player2Score,
    required this.day,
    required this.month,
    required this.year,
  });
}
