part of 'user_cubit.dart';

@immutable
sealed class UserState {}

final class GetUserInitial extends UserState {}

final class GetUserSuccess extends UserState {
  final UserModel user;

  GetUserSuccess({required this.user});
}

final class GetUserFailure extends UserState {
  final String errMessage;

  GetUserFailure({required this.errMessage});
}

final class GetUserLoading extends UserState {}

final class GetUserReward extends UserState {}
