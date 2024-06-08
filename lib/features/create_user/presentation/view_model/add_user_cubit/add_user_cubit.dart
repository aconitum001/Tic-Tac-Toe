import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/create_user/data/create_user_repo/create_user_impl.dart';

part 'add_user_state.dart';

class AddUserCubit extends Cubit<AddUserState> {
  AddUserCubit(this.createUserImpl) : super(AddUserInitial());

  CreateUserImpl createUserImpl;

  Future<void> adduser({required UserModel user}) async {
    emit(AddUserLoading());

    try {
      await createUserImpl.addUser(user: user);
      emit(AddUserSuccess());
    } on Exception catch (e) {
      emit(
        AddUserFailure(errMessage: e.toString()),
      );
    }
  }
}
