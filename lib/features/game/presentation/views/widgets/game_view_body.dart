import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/game/data/models/game_tile_mode.dart';
import 'package:tic_tac_toe/features/game/presentation/view_models/game_board_cubit/game_board_cubit.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/custom_game_view_appbar.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/display_players_info_section.dart';

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
        const GameBoardSection()
      ],
    );
  }
}

class GameBoardSection extends StatelessWidget {
  const GameBoardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.all(17.w),
        height: 410.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          color: Theme.of(context).colorScheme.onPrimary,
        ),
        child: GridView.builder(
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
            );
          },
        ),
      ),
    );
  }
}

class GameBoardTile extends StatelessWidget {
  const GameBoardTile({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameBoardCubit, GameBoardState>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            print(index);
            GameTileModel tile = GameTileModel(
              userName: "userName",
              image: AppAssets.oStyle1,
              isChecked: true,
            );
            BlocProvider.of<GameBoardCubit>(context)
                .addPlayerMove(index: index, tile: tile);
          },
          child: Container(
            padding: EdgeInsets.all(15.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              color: Theme.of(context).colorScheme.surface,
            ),
            child: BlocProvider.of<GameBoardCubit>(context)
                    .board[index]
                    .isChecked
                ? SvgPicture.asset(
                    BlocProvider.of<GameBoardCubit>(context).board[index].image,
                  )
                : null,
          ),
        );
      },
    );
  }
}
