import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tic_tac_toe/core/utils/app_router.dart';
import 'package:tic_tac_toe/core/utils/constants.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/service_locator.dart';
import 'package:tic_tac_toe/core/utils/simple_bloc_observer.dart';
import 'package:tic_tac_toe/core/utils/themes.dart';
import 'package:tic_tac_toe/features/game/data/game_repo/game_repo_impl.dart';
import 'package:tic_tac_toe/features/game/presentation/view_models/game_board_cubit/game_board_cubit.dart';
import 'package:tic_tac_toe/features/home/data/home_repo/home_repo_impl.dart';
import 'package:tic_tac_toe/features/home/presentation/view_model/user_cubit/user_cubit.dart';
import 'package:tic_tac_toe/features/settings/data/models/game_history_model.dart';
import 'package:tic_tac_toe/features/settings/presentation/view_model/game_history_cubit/game_history_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter((UserModelAdapter()));
  Hive.registerAdapter((GameHistoryModelAdapter()));
  await Hive.openBox<UserModel>(kUserBox);
  await Hive.openBox<GameHistoryModel>(kHistoryBox);
  Bloc.observer = SimpleBlocObserver();
  setup();
  runApp(const TicTacToe());
}

class TicTacToe extends StatelessWidget {
  const TicTacToe({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UserCubit(getIt.get<HomeRepoImpl>()),
          ),
          BlocProvider(
            create: (context) => GameBoardCubit(
              getIt.get<GameRepoImpl>(),
            ),
          ),
          BlocProvider(
            create: (context) => GameHistoryCubit(),
          ),
        ],
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: darkTheme,
        ),
      ),
    );
  }
}
