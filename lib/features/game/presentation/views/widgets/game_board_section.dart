import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_board_tile_duo.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_bord_tile.dart';

class GameBoardSection extends StatelessWidget {
  const GameBoardSection({
    super.key,
    required this.player1,
    required this.player2,
    required this.dificulty,
    required this.gameMode,
    required this.selectedSkins,
  });
  final UserModel player1, player2;
  final String dificulty, gameMode;
  final List<String> selectedSkins;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.all(17.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 93.48.w / 95.87.h,
            crossAxisSpacing: 15.w,
            mainAxisSpacing: 24.h,
          ),
          itemCount: 9,
          itemBuilder: (context, index) {
            if (gameMode == "duo") {
              return GameBoardTileDuo(
                index: index,
                player1: player1,
                player2: player2,
                player1SelectedSkin: selectedSkins[0],
                player2SelectedSkin: selectedSkins[1],
                dificulty: dificulty,
              );
            } else {
              return GameBoardTile(
                index: index,
                player1: player1,
                player2: player2,
                player1SelectedSkin: selectedSkins[0],
                player2SelectedSkin: selectedSkins[1],
                dificulty: dificulty,
              );
            }
          },
        ),
      ),
    );
  }
}
