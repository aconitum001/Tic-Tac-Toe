import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/app_router.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/core/widgets/custom_text_button.dart';

class GameChallengeButtonsSection extends StatelessWidget {
  const GameChallengeButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          CustomTextButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kGameRulesView);
            },
            text: "Challenge Details",
            backgroundColor: [
              Theme.of(context).colorScheme.secondary,
              Theme.of(context).colorScheme.onSecondary,
            ],
            textColor: Theme.of(context).colorScheme.onSecondaryContainer,
            style: AppStyles.style20.copyWith(
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          SizedBox(
            height: 25.h,
          ),
        ],
      ),
    );
  }
}
