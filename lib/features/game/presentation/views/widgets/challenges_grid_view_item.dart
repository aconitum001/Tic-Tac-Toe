import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/colors.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_grid_view_button.dart';

class ChallengesGridViewItem extends StatelessWidget {
  const ChallengesGridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 113.w,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(21.42.r),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
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
          SizedBox(
            height: 10.h,
          ),
          SvgPicture.asset(
            AppAssets.round5,
            color: AppColors.grey3,
          ),
          CustomGridViewButton(
            text: "Win 5 Games",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
