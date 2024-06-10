import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/game/presentation/view_models/game_board_cubit/game_board_cubit.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_bord_tile.dart';

class GameBoardSection extends StatelessWidget {
  const GameBoardSection({
    super.key,
    required this.player1,
    required this.player2,
  });
  final UserModel player1, player2;

  @override
  Widget build(BuildContext context) {
    return BlocListener<GameBoardCubit, GameBoardState>(
      listener: (context, state) {
        if (state is GameBoardFinished) {
          showGameResults(context, state);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Container(
          padding: EdgeInsets.all(17.w),
          height: 410.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 93.48.w / 95.87.h,
              crossAxisSpacing: 15.w,
              mainAxisSpacing: 24.h,
            ),
            itemCount: 9,
            itemBuilder: (context, index) {
              return GameBoardTile(
                index: index,
                player1: player1,
                player2: player2,
                player1SelectedSkin: player1.selectedSkin[0],
                player2SelectedSkin: player2.selectedSkin[1],
              );
            },
          ),
        ),
      ),
    );
  }

  void showGameResults(BuildContext context, GameBoardFinished state) {
    BlocProvider.of<GameBoardCubit>(context).resetGame();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "You Win ${state.winner}",
            style: AppStyles.style25.copyWith(
              color: const Color(0xffFF9900),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
