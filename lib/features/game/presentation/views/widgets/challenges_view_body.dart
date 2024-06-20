import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/skin_store_app_bar.dart';

class ChallengesViewBody extends StatelessWidget {
  const ChallengesViewBody({
    super.key,
    required this.player1,
    required this.player2,
  });

  final UserModel player1, player2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkinStoreAppBar(
          user: player1,
        ),
        Text(
          "Challenges",
          style: AppStyles.style35,
        ),
      ],
    );
  }
}
