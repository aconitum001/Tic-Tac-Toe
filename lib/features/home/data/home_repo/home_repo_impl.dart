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
}
