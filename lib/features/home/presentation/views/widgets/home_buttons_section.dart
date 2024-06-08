import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/core/widgets/custom_primary_button.dart';

class HomeButtonsSection extends StatelessWidget {
  const HomeButtonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomPrimaryTextButton(
          onPressed: () {},
          icon: Icons.person,
          text: "Play Solo",
          width: 30.w,
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
          icon: Icons.person,
          text: "Play With A Friend",
          width: 30.w,
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
          icon: Icons.person,
          text: "Play in Challenge mode",
          width: 30.w,
          style: AppStyles.style20.copyWith(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
      ],
    );
  }
}
