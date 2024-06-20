import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/skin_store_app_bar.dart';

class ChallengesViewBody extends StatelessWidget {
  const ChallengesViewBody({
    super.key,
    required this.player1,
    required this.player2,
  });

  final UserModel player1, player2;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkinStoreAppBar(
          user: player1,
        ),
        Text(
          "Challenges",
          style: AppStyles.style35,
        ),
        ChallengesGridViewItem(),
      ],
    );
  }
}

class ChallengesGridViewItem extends StatelessWidget {
  const ChallengesGridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 113.w,
      height: 119.94.h,
      padding: EdgeInsets.symmetric(vertical: 8.w),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(21.42.r),
      ),
      child: Column(
        children: [
          Text(
            "Challenge 1",
            style: AppStyles.style12,
          ),
          Divider(
            endIndent: 18.45.w,
            indent: 18.45.w,
            height: 1,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
