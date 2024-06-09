import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/service_locator.dart';
import 'package:tic_tac_toe/features/home/data/home_repo/home_repo_impl.dart';
import 'package:tic_tac_toe/features/home/presentation/view_models/get_user_cubit/get_user_cubit.dart';
import 'package:tic_tac_toe/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(AppAssets.primaryDarkBackground),
        fit: BoxFit.fill,
      )),
      child: BlocProvider(
        create: (context) => GetUserCubit(getIt.get<HomeRepoImpl>()),
        child: const SafeArea(
          child: Scaffold(
            body: HomeViewBody(),
          ),
        ),
      ),
    );
  }
}
