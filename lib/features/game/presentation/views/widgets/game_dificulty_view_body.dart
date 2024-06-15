import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_difficulty_app_bar.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_difficulty_buttons_section.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/navigate_to_game_view_button.dart';

class GameDificultyViewBody extends StatefulWidget {
  const GameDificultyViewBody(
      {super.key, required this.player1, required this.player2});

  final UserModel player1, player2;

  @override
  State<GameDificultyViewBody> createState() => _GameDificultyViewBodyState();
}

class _GameDificultyViewBodyState extends State<GameDificultyViewBody> {
  int selectedDifficulty = 0;

  void onDifficultySelected(int difficulty) {
    setState(() {
      selectedDifficulty = difficulty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomGameAppBar(),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Choose",
          style: AppStyles.style35,
          textAlign: TextAlign.center,
        ),
        Text(
          "The Difficulty Mode",
          style: AppStyles.style35,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 70.h,
        ),
        GameDifficultyButtonsSection(
          selectedDifficulty: selectedDifficulty,
          onDifficultySelected: onDifficultySelected,
        ),
        SizedBox(
          height: 80.h,
        ),
        NavigateToGameViewButton(
          selectedDifficulty: selectedDifficulty,
          widget: widget,
        ),
      ],
    );
  }
}
