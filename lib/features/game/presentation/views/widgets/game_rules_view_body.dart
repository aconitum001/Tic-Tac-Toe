import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tic_tac_toe/features/game/presentation/views/widgets/custom_game_view_appbar.dart';

import 'game_rules_section.dart';

class GameRulesViewBody extends StatelessWidget {
  const GameRulesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomGameViewAppBar(),
        SizedBox(
          height: 30.h,
        ),
        const GameRulesSection()
      ],
    );
  }
}
