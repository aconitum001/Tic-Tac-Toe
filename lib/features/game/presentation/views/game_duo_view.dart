import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_duo_view_body.dart';

class GameDuoView extends StatelessWidget {
  const GameDuoView(
      {super.key,
      required this.player1,
      required this.player2,
      required this.selectedSkins});

  final UserModel player1, player2;
  final List<String> selectedSkins;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.primaryDarkBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        body: GameDuoViewBody(
          player1: player1,
          player2: player2,
          selectedSkins: selectedSkins,
        ),
      ),
    );
  }
}
