import 'package:tic_tac_toe/core/utils/models/user_model.dart';

abstract class HomeRepo {
  Future<UserModel> getUser();

  void updateUserPoints({required UserModel user, required int points});

  void addUserWin({required UserModel user});

  void addUserLose({required UserModel user});

  void addUserDraw({required UserModel user});
}
