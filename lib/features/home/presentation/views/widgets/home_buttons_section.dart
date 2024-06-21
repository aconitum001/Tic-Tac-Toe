import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/app_router.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/core/widgets/custom_primary_button.dart';
import 'package:tic_tac_toe/features/home/data/models/navigations_param_model.dart';

class HomeButtonsSection extends StatelessWidget {
  const HomeButtonsSection({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPrimaryTextButton(
          onPressed: () {
            UserModel bot = UserModel(
              userName: "Bot",
              avatar: AppAssets.botAvatar1,
              points: 0,
              skinsCollection: [],
              unlockedSkins: [],
              unlockedChallenges: [],
              challengesFinished: [],
              selectedSkin: user.selectedSkin,
              wins: 0,
              loses: 0,
              draws: 0,
            );
            GoRouter.of(context).push(
              AppRouter.kGameDificultyView,
              extra:
                  NavigationParams(player1: user, player2: bot, difficulty: ""),
            );
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
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kCreatePlayerView, extra: user);
          },
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
          onPressed: () {
            UserModel bot = UserModel(
              userName: "Bot",
              avatar: AppAssets.botAvatar1,
              points: 0,
              skinsCollection: [],
              unlockedSkins: [],
              unlockedChallenges: [],
              challengesFinished: [],
              selectedSkin: user.selectedSkin,
              wins: 0,
              loses: 0,
              draws: 0,
            );
            GoRouter.of(context).push(
              AppRouter.kChallengesView,
              extra: NavigationParams(
                player1: user,
                player2: bot,
                difficulty: "",
              ),
            );
          },
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
