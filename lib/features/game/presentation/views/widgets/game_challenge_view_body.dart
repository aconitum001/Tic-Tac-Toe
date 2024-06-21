import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';

class GameChallengeViewBody extends StatelessWidget {
  const GameChallengeViewBody({
    super.key,
    required this.player1,
    required this.player2,
    required this.difficulty,
  });

  final UserModel player1, player2;
  final String difficulty;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
