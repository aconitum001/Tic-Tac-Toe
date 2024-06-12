import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/app_router.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/core/widgets/custom_secondary_button.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_dificulty_view_body.dart';
import 'package:tic_tac_toe/features/home/data/models/navigations_param_model.dart';

class NavigateToGameViewButton extends StatelessWidget {
  const NavigateToGameViewButton({
    super.key,
    required this.selectedDifficulty,
    required this.widget,
  });

  final int selectedDifficulty;
  final GameDificultyViewBody widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: CustomSecondaryButton(
        onPressed: () {
          String difficulty;
          if (selectedDifficulty == 0) {
            difficulty = "hard";
          } else if (selectedDifficulty == 1) {
            difficulty = "medium";
          } else {
            difficulty = "easy";
          }
          GoRouter.of(context).push(
            AppRouter.kGameView,
            extra: NavigationParams(
              player1: widget.player1,
              player2: widget.player2,
              difficulty: difficulty,
            ),
          );
        },
        bgColor: Theme.of(context).colorScheme.primaryContainer,
        borderColor: Colors.transparent,
        child: Text(
          "Next",
          style: AppStyles.style20.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ),
    );
  }
}
