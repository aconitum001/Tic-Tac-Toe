import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tic_tac_toe/core/utils/constants.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/challenges_grid_view_item.dart';
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
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SkinStoreAppBar(
                user: player1,
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Challenges",
                style: AppStyles.style35,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.only(right: 65.w, left: 65.w, bottom: 20.h),
          sliver: AnimationLimiter(
            child: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 54.w,
                mainAxisSpacing: 40.h,
                childAspectRatio: 1 / 1.1,
              ),
              itemBuilder: (context, index) {
                bool isLocked = true;
                bool isFinished = false;
                if (player1.unlockedChallenges.contains(index)) {
                  isLocked = false;
                }
                if (player1.challengesFinished.contains(index)) {
                  isFinished = true;
                }
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  columnCount: 2,
                  duration: const Duration(seconds: 1),
                  child: ScaleAnimation(
                    child: ChallengesGridViewItem(
                      challenge: challengesList[index],
                      index: index,
                      isLocked: isLocked,
                      isFinished: isFinished,
                      player1: player1,
                      player2: player2,
                    ),
                  ),
                );
              },
              itemCount: challengesList.length,
            ),
          ),
        )
      ],
    );
  }
}
