import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/functions/custom_shadow.dart';

class CustomPrimaryTextButton extends StatelessWidget {
  const CustomPrimaryTextButton(
      {super.key,
      required this.icon,
      required this.text,
      required this.style,
      required this.onPressed,
      required this.width});

  final IconData icon;
  final String text;
  final TextStyle style;
  final void Function()? onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildShadow(
        context,
        Theme.of(context).colorScheme.primaryContainer.withOpacity(0.25),
        20.r,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          minimumSize: Size(double.infinity, 70.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              size: 35.w,
            ),
            SizedBox(
              width: width,
            ),
            Text(
              text,
              style: style,
            )
          ],
        ),
      ),
    );
  }
}
