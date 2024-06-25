import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/home/data/home_repo/home_repo_impl.dart';

part 'user_cubit_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit(this.homeRepo) : super(GetUserInitial());
  final HomeRepoImpl homeRepo;

  Future<void> getUser() async {
    emit(GetUserLoading());
    try {
      UserModel user = await homeRepo.getUser();
      emit(GetUserSuccess(user: user));
    } on Exception catch (e) {
      emit(GetUserFailure(
        errMessage: e.toString(),
      ));
    }
  }

  void showReward() {
    emit(GetUserReward());
  }

  void showNewSkin({required int skinIndex}) {
    emit(
      GetUserNewSkin(skinIndex: skinIndex),
    );
  }

  void updateUserPoints({required int points, required UserModel user}) {
    homeRepo.updateUserPoints(user: user, points: points);
    emit(GetUserSuccess(user: user));
  }

  void addUserWins({required UserModel user}) {
    homeRepo.addUserWin(user: user);
    emit(GetUserSuccess(user: user));
  }

  void addUserLoses({required UserModel user}) {
    homeRepo.addUserLose(user: user);
    emit(GetUserSuccess(user: user));
  }

  void addUserDraws({required UserModel user}) {
    homeRepo.addUserDraw(user: user);
    emit(GetUserSuccess(user: user));
  }
}
