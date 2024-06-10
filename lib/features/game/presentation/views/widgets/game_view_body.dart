import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/core/widgets/custom_primary_button.dart';
import 'package:tic_tac_toe/core/widgets/custom_text_button.dart';
import 'package:tic_tac_toe/features/game/presentation/view_models/game_board_cubit/game_board_cubit.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/custom_game_view_appbar.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/display_players_info_section.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_board_section.dart';

class GameViewBody extends StatelessWidget {
  const GameViewBody({super.key, required this.player1, required this.player2});
  final UserModel player1, player2;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
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
        ),
        SizedBox(
          height: 40.h,
        ),
        const GameButtonsSection(),
      ],
    );
  }
}

class GameButtonsSection extends StatelessWidget {
  const GameButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          CustomPrimaryTextButton(
            icon: Icons.loop,
            text: "Reset Game",
            style: AppStyles.style20.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
            onPressed: () {
              BlocProvider.of<GameBoardCubit>(context).resetGame();
            },
            width: 75.w,
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomTextButton(
            text: "Game Rules",
            backgroundColor: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.onSecondary,
            ],
            textColor: Theme.of(context).colorScheme.onSecondaryContainer,
            style: AppStyles.style20.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}
