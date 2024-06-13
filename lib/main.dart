import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tic_tac_toe/core/utils/app_router.dart';
import 'package:tic_tac_toe/core/utils/constants.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/service_locator.dart';
import 'package:tic_tac_toe/core/utils/themes.dart';
import 'package:tic_tac_toe/features/home/data/home_repo/home_repo_impl.dart';
import 'package:tic_tac_toe/features/home/presentation/view_model/user_cubit/user_cubit.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter((UserModelAdapter()));
  await Hive.openBox<UserModel>(kUserBox);
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
      builder: (context, child) => BlocProvider(
        create: (context) => UserCubit(getIt.get<HomeRepoImpl>()),
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          theme: darkTheme,
        ),
      ),
    );
  }
}
