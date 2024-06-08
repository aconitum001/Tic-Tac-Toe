import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel {
  @HiveField(0)
  String userName;
  @HiveField(1)
  String avatar;
  @HiveField(2)
  int points;
  @HiveField(3)
  List<int> skinsCollection;
  @HiveField(4)
  List<int> challengesFinished;
  @HiveField(5)
  List<String> selectedSkin;

  UserModel({
    required this.userName,
    required this.avatar,
    required this.points,
    required this.skinsCollection,
    required this.challengesFinished,
    required this.selectedSkin,
  });

  @override
  String toString() {
    return 'UserModel{userName: $userName, avatar: $avatar, points: $points, skinsCollection: $skinsCollection, challengesFinished: $challengesFinished}';
  }
}
