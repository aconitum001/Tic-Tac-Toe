import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/core/widgets/custom_primary_button.dart';
import 'package:tic_tac_toe/features/game/presentation/view_models/game_board_cubit/game_board_cubit.dart';

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
            width: 70.w,
          ),
          SizedBox(
            height: 20.h,
          ),
        ],
      ),
    );
  }
}
