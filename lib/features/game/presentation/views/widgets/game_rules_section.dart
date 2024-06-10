import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/game_rule_widget.dart';

class GameRulesSection extends StatelessWidget {
  const GameRulesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Game Rules",
            style: AppStyles.style37,
          ),
          SizedBox(
            height: 9.h,
          ),
          Divider(
            endIndent: MediaQuery.of(context).size.width * 0.6,
            indent: 8.w,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Column(
              children: [
                GameRuleWidget(
                  title: "Win",
                  subtitle1: "Get 3 marks in a row,",
                  subtitle2: "player Wins, game ends.",
                  image: AppAssets.rulesWin,
                  scale: 2.2,
                  space: 15.w,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.047,
                ),
                GameRuleWidget(
                  title: "Defeat",
                  subtitle1: "Opponent gets 3 in a row,",
                  subtitle2: "Player loses, game ends.",
                  image: AppAssets.rulesLose,
                  scale: 2.7,
                  space: 15.w,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.047,
                ),
                GameRuleWidget(
                  title: "Draw",
                  subtitle1: "Board full no 3 in a row,",
                  subtitle2: "No Winner, game ends.",
                  image: AppAssets.rulesDraw,
                  scale: 2.2,
                  space: 10.w,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
