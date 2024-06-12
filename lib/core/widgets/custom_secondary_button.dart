import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSecondaryButton extends StatelessWidget {
  const CustomSecondaryButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.bgColor,
    required this.borderColor,
  });

  final void Function()? onPressed;
  final Widget child;
  final Color bgColor, borderColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        maximumSize: Size(double.infinity, 58.h),
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.r),
          side: BorderSide(color: borderColor, width: 2),
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
