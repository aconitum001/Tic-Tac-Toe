import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/features/settings/data/models/game_history_model.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/game_history_stats_widget.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/game_history_user_info_stats.dart';

class GameHistoryListViewItem extends StatefulWidget {
  const GameHistoryListViewItem({
    super.key,
    required this.index,
    required this.startAnimation,
    required this.historyModel,
  });

  final int index;
  final bool startAnimation;
  final GameHistoryModel historyModel;

  @override
  State<GameHistoryListViewItem> createState() =>
      _GameHistoryListViewItemState();
}

class _GameHistoryListViewItemState extends State<GameHistoryListViewItem> {
  bool shouldStartAnimation = false;

  @override
  void initState() {
    super.initState();
    if (widget.startAnimation) {
      Future.delayed(Duration(milliseconds: widget.index * 250), () {
        if (mounted) {
          setState(() {
            shouldStartAnimation = true;
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 40.w,
        vertical: 8.h,
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOut,
        transform: Matrix4.translationValues(
            shouldStartAnimation ? 0 : MediaQuery.of(context).size.width, 0, 0),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21.42.r),
          color: Theme.of(context).colorScheme.onPrimary,
          border: Border.all(
            color: Theme.of(context).colorScheme.primaryContainer,
            width: 2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GameHistoryUserInfoWidget(
              avatar: widget.historyModel.player1Avatar,
              score: widget.historyModel.player1Score,
              playerName: widget.historyModel.player1UserName,
            ),
            GameHistoryStatsWidget(
              index: widget.index + 1,
              time: "9:30",
              month: widget.historyModel.month,
              day: widget.historyModel.day,
              player1Skin: widget.historyModel.player1Skin,
              player2Skin: widget.historyModel.player2Skin,
            ),
            GameHistoryUserInfoWidget(
              avatar: widget.historyModel.player2Avatar,
              score: widget.historyModel.player2Score,
              playerName: widget.historyModel.player2UserName,
            ),
          ],
        ),
      ),
    );
  }
}
