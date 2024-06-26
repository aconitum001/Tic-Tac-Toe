import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe/core/utils/app_router.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/challenges_view_body.dart';
import 'package:tic_tac_toe/features/home/data/models/navigations_param_model.dart';
import 'package:tic_tac_toe/features/home/presentation/view_model/user_cubit/user_cubit.dart';

class ChallengesView extends StatelessWidget {
  const ChallengesView({
    super.key,
    required this.player1,
    required this.player2,
  });
  final UserModel player1, player2;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is GetUserReward) {
          late int skinIndex;
          if (player1.points >= 100 && !player1.unlockedSkins.contains(1)) {
            player1.unlockedSkins.add(1);
            skinIndex = 1;
          } else if (player1.points >= 200 &&
              !player1.unlockedSkins.contains(2)) {
            player1.unlockedSkins.add(2);
            skinIndex = 2;
          } else if (player1.points >= 300 &&
              !player1.unlockedSkins.contains(3)) {
            player1.unlockedSkins.add(3);
            skinIndex = 3;
          } else if (player1.points >= 400 &&
              !player1.unlockedSkins.contains(4)) {
            player1.unlockedSkins.add(4);
            skinIndex = 4;
          } else if (player1.points >= 500 &&
              !player1.unlockedSkins.contains(5)) {
            player1.unlockedSkins.add(5);
            skinIndex = 5;
          } else if (player1.points >= 600 &&
              !player1.unlockedSkins.contains(6)) {
            player1.unlockedSkins.add(6);
            skinIndex = 6;
          } else if (player1.points >= 700 &&
              !player1.unlockedSkins.contains(7)) {
            player1.unlockedSkins.add(7);
            skinIndex = 7;
          } else if (player1.points >= 800 &&
              !player1.unlockedSkins.contains(8)) {
            player1.unlockedSkins.add(8);
            skinIndex = 8;
          }
          giftMethode(context, skinIndex);
        }
      },
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.twoStarDarkBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Scaffold(
            body: ChallengesViewBody(
              player1: player1,
              player2: player2,
            ),
          ),
        ),
      ),
    );
  }

  void giftMethode(BuildContext context, int skinIndex) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          title: Center(
            child: Text(
              "Your New skin!",
              style: AppStyles.style25.copyWith(
                color: const Color(0xffF9BC05),
              ),
            ),
          ),
          content: Container(
            child: Lottie.asset(
              "assets/animations/gift.json",
              repeat: false,
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20.r,
                      ),
                    ),
                    backgroundColor: const Color(0xffFFBF00),
                  ),
                  onPressed: () {
                    GoRouter.of(context).pop();
                    GoRouter.of(context).push(AppRouter.kSkinStoreView,
                        extra: NavigationParams(
                          player1: player1,
                          player2: player1,
                          difficulty: "",
                          skinIndex: skinIndex,
                        ));
                  },
                  child: Text(
                    'Claim your skin',
                    style: AppStyles.style14.copyWith(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
