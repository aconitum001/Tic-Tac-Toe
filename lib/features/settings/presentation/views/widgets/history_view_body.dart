import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/display_user_stats.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/skin_store_app_bar.dart';

class HistoryViewBody extends StatelessWidget {
  const HistoryViewBody({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkinStoreAppBar(user: user),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Game History",
          style: AppStyles.style40,
        ),
        const DisplayUserStatsSection(),
        SizedBox(
          height: 20.h,
        ),
        const GameHistoryListViewItem()
      ],
    );
  }
}

class GameHistoryListViewItem extends StatelessWidget {
  const GameHistoryListViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40.w),
      child: Container(
        height: 117.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(21.42.r),
          color: Theme.of(context).colorScheme.onPrimary,
          border: Border.all(
            color: Theme.of(context).colorScheme.primaryContainer,
            width: 2,
          ),
        ),
        child: Row(
          children: [
            Column(
              children: [],
            )
          ],
        ),
      ),
    );
  }
}
