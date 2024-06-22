import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/features/game/data/models/challenge_model.dart';
import 'package:tic_tac_toe/features/game/presentation/view_models/game_board_cubit/game_board_cubit.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/display_round_widget.dart';

class CustomGameChallengeAppBar extends StatelessWidget {
  const CustomGameChallengeAppBar({
    super.key,
    required this.challenge,
    required this.counter,
  });

  final ChallengeModel challenge;
  final int counter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              BlocProvider.of<GameBoardCubit>(context).resetGame();
            },
            iconSize: 35.w,
            icon: const Icon(Icons.arrow_back),
          ),
          DisplayRoundsWidget(
            counter: counter,
            rounds: challenge.rounds,
          )
        ],
      ),
    );
  }
}
