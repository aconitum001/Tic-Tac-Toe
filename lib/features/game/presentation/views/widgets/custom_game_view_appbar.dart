import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/features/game/presentation/view_models/game_board_cubit/game_board_cubit.dart';

class CustomGameViewAppBar extends StatelessWidget {
  const CustomGameViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
              BlocProvider.of<GameBoardCubit>(context).resetGame();
            },
            iconSize: 35.w,
            icon: const Icon(Icons.arrow_back),
          )
        ],
      ),
    );
  }
}
