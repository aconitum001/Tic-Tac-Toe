import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';

class GameHistoryUserInfoWidget extends StatelessWidget {
  const GameHistoryUserInfoWidget({
    super.key,
    required this.avatar,
    required this.score,
    required this.playerName,
  });

  final String avatar;
  final int score;
  final String playerName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          avatar,
          width: 64.w,
          height: 64.h,
        ),
        Text(
          "$playerName: $score",
          style: AppStyles.style15.copyWith(
            fontWeight: FontWeight.w400,
          ),
          overflow: TextOverflow.ellipsis,
        )
      ],
    );
  }
}
