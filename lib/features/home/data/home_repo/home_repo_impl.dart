import 'package:hive_flutter/hive_flutter.dart';
import 'package:tic_tac_toe/core/utils/constants.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/home/data/home_repo/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  @override
  Future<UserModel> getUser() async {
    var usersBox = await Hive.openBox<UserModel>(kUserBox);
    var users = usersBox.values.toList();
    var user = users[0];

    return user;
  }

  @override
  void updateUserPoints({required UserModel user, required int points}) {
    user.points += points;
    if (user.points < 0) {
      user.points = 0;
    }
    user.save();
  }

  @override
  void addUserDraw({required UserModel user}) {
    user.draws += 1;
    user.save();
  }

  @override
  void addUserLose({required UserModel user}) {
    user.loses += 1;
    user.save();
  }

  @override
  void addUserWin({required UserModel user}) {
    user.wins += 1;
    user.save();
  }
}
