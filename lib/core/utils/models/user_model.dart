import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  String userName;

  @HiveField(1)
  String avatar;

  @HiveField(2)
  int points;

  @HiveField(3)
  List<String> skinsCollection;

  @HiveField(4)
  List<int> challengesFinished;

  @HiveField(5)
  List<String> selectedSkin;

  @HiveField(6)
  int wins;

  @HiveField(7)
  int loses;

  @HiveField(8)
  int draws;

  @HiveField(9)
  List<int> unlockedSkins;

  UserModel({
    required this.userName,
    required this.avatar,
    required this.points,
    required this.skinsCollection,
    required this.challengesFinished,
    required this.selectedSkin,
    required this.draws,
    required this.wins,
    required this.loses,
    required this.unlockedSkins,
  });

  @override
  String toString() {
    return 'UserModel{userName: $userName, avatar: $avatar, points: $points, skinsCollection: $skinsCollection, challengesFinished: $challengesFinished}';
  }
}
