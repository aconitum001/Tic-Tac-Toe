import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/app_router.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/functions/custom_shadow.dart';
import 'package:tic_tac_toe/core/utils/prefrences_service.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/core/widgets/custom_text_button.dart';

class GetStartedViewBody extends StatelessWidget {
  const GetStartedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 4,
          ),
          SvgPicture.asset(AppAssets.logo),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "Tic-Tac-Toe",
            style: AppStyles.style40.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const Spacer(
            flex: 5,
          ),
          Container(
            width: 340.w,
            decoration: buildShadow(
              context,
              Theme.of(context).colorScheme.primaryContainer.withOpacity(0.25),
              20.r,
            ),
            child: CustomTextButton(
              onPressed: () async {
                await navigateToNextPage(context);
              },
              text: "Let's Play!",
              backgroundColor: [
                Theme.of(context).colorScheme.secondary,
                Theme.of(context).colorScheme.onSecondary,
              ],
              textColor: Theme.of(context).colorScheme.onSecondaryContainer,
              style: AppStyles.style20.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }

  Future<void> navigateToNextPage(BuildContext context) async {
    bool isFirstLaunch = await PrefrencesService.isFirstLaunch();
    String pageToNavigate =
        isFirstLaunch ? AppRouter.kCreateUserView : AppRouter.kHomeView;
    GoRouter.of(context).push(pageToNavigate);
  }
}
