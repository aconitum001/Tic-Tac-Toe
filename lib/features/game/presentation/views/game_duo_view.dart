import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_duo_view_body.dart';

class GameDuoView extends StatelessWidget {
  const GameDuoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(AppAssets.primaryDarkBackground),
        fit: BoxFit.fill,
      )),
      child: const Scaffold(
        body: GameDuoViewBody(),
      ),
    );
  }
}
