import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/app_router.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/core/widgets/custom_primary_button.dart';

class HomeButtonsSection extends StatelessWidget {
  const HomeButtonsSection({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPrimaryTextButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kGameView);
          },
          icon: Icons.person,
          text: "Play Solo",
          width: 18.w,
          style: AppStyles.style20.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        CustomPrimaryTextButton(
          onPressed: () {},
          icon: Icons.group,
          text: "Play With A Friend",
          width: 18.w,
          style: AppStyles.style20.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        SizedBox(
          height: 15.h,
        ),
        CustomPrimaryTextButton(
          onPressed: () {},
          icon: Icons.emoji_events,
          text: "Play in Challenge mode",
          width: 18.w,
          style: AppStyles.style20.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ],
    );
  }
}
