import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/challenges_view_body.dart';

class ChallengesView extends StatelessWidget {
  const ChallengesView({
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
          image: AssetImage(AppAssets.twoStarDarkBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        body: ChallengesViewBody(
          player1: player1,
          player2: player2,
        ),
      ),
    );
  }
}
