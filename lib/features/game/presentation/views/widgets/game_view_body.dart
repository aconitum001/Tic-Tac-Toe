import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/custom_game_view_appbar.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/display_players_info_section.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_board_section.dart';

class GameViewBody extends StatelessWidget {
  const GameViewBody({super.key, required this.player1, required this.player2});
  final UserModel player1, player2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomGameViewAppBar(),
        Text(
          "${player1.userName}'s Turn",
          style: AppStyles.style25,
          textAlign: TextAlign.center,
        ),
        DisplayPlayersInfoSection(
          player1: player1,
          player2: player2,
          player1Points: 0,
          player2Points: 0,
        ),
        SizedBox(
          height: 20.h,
        ),
        GameBoardSection(
          player1: player1,
          player2: player2,
        )
      ],
    );
  }
}
