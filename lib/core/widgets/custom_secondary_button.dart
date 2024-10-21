import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/functions/custom_shadow.dart';

class CustomSecondaryButton extends StatelessWidget {
  const CustomSecondaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.bgColor,
    required this.borderColor,
    this.horizantal = 0,
    this.vertical = 0,
  });

  final void Function()? onPressed;
  final Widget child;
  final Color bgColor, borderColor;
  final double horizantal, vertical;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildShadow(
        context,
        Theme.of(context).colorScheme.primaryContainer.withOpacity(.3),
        8.r,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          maximumSize: Size(double.infinity, 58.h),
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.r),
            side: BorderSide(color: borderColor, width: 3),
          ),
        ),
        onPressed: onPressed,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: horizantal, vertical: vertical),
          child: child,
        ),
      ),
    );
  }
}
