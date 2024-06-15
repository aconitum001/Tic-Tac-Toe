import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_view_body.dart';

class GameBotView extends StatelessWidget {
  const GameBotView({
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
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          body: GameBotViewBody(
            player1: player1,
            player2: player2,
            dificulty: dificulty,
          ),
        ),
      ),
    );
  }
}
