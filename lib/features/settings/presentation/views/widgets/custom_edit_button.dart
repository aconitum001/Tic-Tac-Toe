import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/functions/custom_shadow.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';

class CustomEditButton extends StatelessWidget {
  const CustomEditButton({
    super.key,
    this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Container(
        decoration: buildShadow(
          context,
          Theme.of(context).colorScheme.primaryContainer.withOpacity(0.25),
          100.r,
        ),
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100.r),
            ),
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
      ),
    );
  }
}
