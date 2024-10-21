import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/app_router.dart';
import 'package:tic_tac_toe/core/utils/colors.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_grid_view_button.dart';
import 'package:tic_tac_toe/features/game/data/models/challenge_model.dart';
import 'package:tic_tac_toe/features/home/data/models/navigations_param_model.dart';

class ChallengesGridViewItem extends StatelessWidget {
  const ChallengesGridViewItem({
    super.key,
    required this.index,
    required this.challenge,
    required this.isLocked,
    required this.isFinished,
    required this.player1,
    required this.player2,
  });

  final int index;
  final ChallengeModel challenge;
  final bool isLocked;
  final bool isFinished;
  final UserModel player1, player2;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(21.42.r),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Challenge ${index + 1} ",
                        style: AppStyles.style12,
                      ),
                    ),
                    if (isFinished)
                      Icon(
                        Icons.check_circle,
                        size: 13.w,
                      )
                  ],
                ),
              ),
              Divider(
                endIndent: 18.45.w,
                indent: 18.45.w,
                height: 1,
                thickness: 2,
              ),
              SizedBox(
                height: 10.h,
              ),
              SvgPicture.asset(
                challenge.image,
                // ignore: deprecated_member_use
                color: AppColors.grey3,
              ),
              CustomGridViewButton(
                text: !isFinished ? challenge.details : "Finished",
                onPressed: isLocked
                    ? null
                    : (isFinished
                        ? null
                        : () {
                            GoRouter.of(context).push(
                              AppRouter.kGameChallengeView,
                              extra: NavigationParams(
                                player1: player1,
                                player2: player2,
                                difficulty: "",
                                challenge: challenge,
                              ),
                            );
                          }),
              )
            ],
          ),
        ),
        if (isLocked)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary.withOpacity(0.7),
                borderRadius: BorderRadius.circular(21.42.r),
              ),
            ),
          ),
      ],
    );
  }
}
