import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_challenge_view_body.dart';

class GameChallengeView extends StatelessWidget {
  const GameChallengeView({
    super.key,
    required this.player1,
    required this.player2,
    required this.dificulty,
  });

  final UserModel player1, player2;
  final String dificulty;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.primaryDarkBackground),
        ),
      ),
      child: Scaffold(
        body: GameChallengeViewBody(
          player1: player1,
          player2: player2,
          difficulty: dificulty,
        ),
      ),
    );
  }
}
