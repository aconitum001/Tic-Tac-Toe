import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/service_locator.dart';
import 'package:tic_tac_toe/features/game/data/game_repo/game_repo_impl.dart';
import 'package:tic_tac_toe/features/game/presentation/view_models/game_board_cubit/game_board_cubit.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_view_body.dart';

class GameView extends StatelessWidget {
  const GameView({super.key, required this.player1, required this.player2});

  final UserModel player1, player2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.primaryDarkBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: BlocProvider(
        create: (context) => GameBoardCubit(getIt.get<GameRepoImpl>()),
        child: SafeArea(
          child: Scaffold(
            body: GameViewBody(
              player1: player1,
              player2: player2,
            ),
          ),
        ),
      ),
    );
  }
}
