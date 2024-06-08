import 'package:get_it/get_it.dart';
import 'package:tic_tac_toe/features/create_user/data/create_user_repo/create_user_impl.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<CreateUserImpl>(CreateUserImpl());
}
