import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_dificulty_view_body.dart';

class GameDificultyView extends StatelessWidget {
  const GameDificultyView({
    super.key,
    required this.player1,
    required this.player2,
  });

  final UserModel player1, player2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.oneStarDarkBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        body: GameDificultyViewBody(
          player1: player1,
          player2: player2,
        ),
      ),
    );
  }
}
