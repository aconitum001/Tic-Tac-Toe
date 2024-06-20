import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';

class ChallengesViewBody extends StatelessWidget {
  const ChallengesViewBody({
    super.key,
    required this.player1,
    required this.player2,
  });

  final UserModel player1, player2;

  @override
  Widget build(BuildContext context) {
    return Column();
  }
}
