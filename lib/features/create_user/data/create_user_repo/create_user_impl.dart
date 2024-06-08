import 'package:hive_flutter/hive_flutter.dart';
import 'package:tic_tac_toe/core/utils/constants.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/create_user/data/create_user_repo/create_user_repo.dart';

class CreateUserImpl implements CreateUserRepo {
  @override
  Future<void> addUser({required UserModel user}) async {
    var users = await Hive.openBox<UserModel>(kUserBox);
    users.add(user);
  }
}
