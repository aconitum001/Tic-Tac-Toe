import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
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
            flex: 3,
          ),
          SvgPicture.asset(AppAssets.logo),
          SizedBox(
            height: 25.h,
          ),
          Text(
            "Tic-Tac-Toe",
            style: AppStyles.style45.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const Spacer(
            flex: 4,
          ),
          CustomTextButton(
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
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
