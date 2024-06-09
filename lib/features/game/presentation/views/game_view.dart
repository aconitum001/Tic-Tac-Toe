import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_view_body.dart';

class GameView extends StatelessWidget {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.secoundaryDarkBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: const SafeArea(
        child: Scaffold(
          body: GameViewBody(),
        ),
      ),
    );
  }
}
