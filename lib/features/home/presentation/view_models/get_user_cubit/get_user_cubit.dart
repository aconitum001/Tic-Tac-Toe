import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/home/data/home_repo/home_repo_impl.dart';

part 'get_user_state.dart';

class GetUserCubit extends Cubit<GetUserState> {
  GetUserCubit(this.homeRepo) : super(GetUserInitial());
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
}
