import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/service_locator.dart';
import 'package:tic_tac_toe/features/create_user/data/create_user_repo/create_user_impl.dart';
import 'package:tic_tac_toe/features/create_user/presentation/view_model/add_user_cubit/add_user_cubit.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/create_user_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateUserView extends StatelessWidget {
  const CreateUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.secoundaryDarkBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: BlocProvider(
        create: (context) => AddUserCubit(getIt.get<CreateUserImpl>()),
        child: const Scaffold(
          resizeToAvoidBottomInset: true,
          body: CreateUserViewBody(),
        ),
      ),
    );
  }
}
