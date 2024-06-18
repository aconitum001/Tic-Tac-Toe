import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/game_history_stats_widget.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/game_history_user_info_stats.dart';

class GameHistoryListViewItem extends StatelessWidget {
  const GameHistoryListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21.42.r),
          color: Theme.of(context).colorScheme.onPrimary,
          border: Border.all(
            color: Theme.of(context).colorScheme.primaryContainer,
            width: 2,
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GameHistoryUserInfoWidget(
              avatar: AppAssets.avtar1,
              score: 1,
              playerName: "You",
            ),
            GameHistoryStatsWidget(
              index: 1,
              time: "9:30",
              month: "5 juin",
              day: "Wed",
              player1Skin: AppAssets.oStyle1,
              player2Skin: AppAssets.xStyle1,
            ),
            GameHistoryUserInfoWidget(
              avatar: AppAssets.avtar2,
              score: 3,
              playerName: "Friend",
            ),
          ],
        ),
      ),
    );
  }
}
