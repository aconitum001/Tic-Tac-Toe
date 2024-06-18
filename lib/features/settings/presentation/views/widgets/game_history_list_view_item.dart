import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/features/settings/data/models/game_history_model.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/game_history_stats_widget.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/game_history_user_info_stats.dart';

class GameHistoryListViewItem extends StatefulWidget {
  const GameHistoryListViewItem({
    Key? key,
    required this.index,
    required this.startAnimation,
    required this.historyModel,
  }) : super(key: key);

  final int index;
  final bool startAnimation;
  final GameHistoryModel historyModel;

  @override
  State<GameHistoryListViewItem> createState() =>
      _GameHistoryListViewItemState();
}

class _GameHistoryListViewItemState extends State<GameHistoryListViewItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
    if (widget.startAnimation) {
      Future.delayed(Duration(milliseconds: widget.index * 250), () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(GameHistoryListViewItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.startAnimation && !oldWidget.startAnimation) {
      Future.delayed(Duration(milliseconds: widget.index * 250), () {
        if (mounted) {
          _controller.forward();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 40.w,
          vertical: 8.h,
        ),
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
      ),
    );
  }
}
