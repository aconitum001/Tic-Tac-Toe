import 'package:tic_tac_toe/core/utils/models/user_model.dart';

abstract class CreateUserRepo {
  Future<void> addUser({required UserModel user});
}
