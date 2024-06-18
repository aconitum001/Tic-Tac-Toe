import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/styles.dart';

class GameHistoryStatsWidget extends StatelessWidget {
  const GameHistoryStatsWidget({
    super.key,
    required this.index,
    required this.player1Skin,
    required this.player2Skin,
    required this.date,
  });

  final int index;
  final String player1Skin, player2Skin;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Match $index",
          style: AppStyles.style15,
        ),
        Row(
          children: [
            SvgPicture.asset(
              player1Skin,
              fit: BoxFit.scaleDown,
              width: 30.w,
              height: 30.h,
              clipBehavior: Clip.none,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              ":",
              style: AppStyles.style30.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            SvgPicture.asset(
              player2Skin,
              width: 30.w,
              height: 30.h,
              clipBehavior: Clip.none,
            ),
          ],
        ),
        Text(
          date,
          style: AppStyles.style11,
        )
      ],
    );
  }
}
