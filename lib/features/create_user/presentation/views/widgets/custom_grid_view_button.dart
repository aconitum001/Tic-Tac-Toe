import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';

class CustomGridViewButton extends StatelessWidget {
  const CustomGridViewButton({super.key, this.onPressed, required this.text});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: MaterialButton(
        disabledColor:
            Theme.of(context).colorScheme.primaryContainer.withOpacity(0.6),
        onPressed: onPressed,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(21.24.r),
        ),
        padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 2.w),
        height: 30.h,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            text,
            style: AppStyles.style12.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
      ),
    );
  }
}
