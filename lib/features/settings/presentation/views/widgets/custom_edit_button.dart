import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';

class CustomEditButton extends StatelessWidget {
  const CustomEditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: TextButton(
        onPressed: () {},
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          fixedSize: Size(
            double.infinity,
            38.h,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              AppAssets.edit,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              "Edit Profile",
              style: AppStyles.style19.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            )
          ],
        ),
      ),
    );
  }
}
