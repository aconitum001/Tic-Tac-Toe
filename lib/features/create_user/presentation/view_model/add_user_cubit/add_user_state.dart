part of 'add_user_cubit.dart';

@immutable
sealed class AddUserState {}

final class AddUserInitial extends AddUserState {}

final class AddUserSuccess extends AddUserState {}

final class AddUserFailure extends AddUserState {
  final String errMessage;

  AddUserFailure({required this.errMessage});
}

final class AddUserLoading extends AddUserState {}
