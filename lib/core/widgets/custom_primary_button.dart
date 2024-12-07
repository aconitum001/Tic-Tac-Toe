import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/functions/custom_shadow.dart';

class CustomPrimaryTextButton extends StatelessWidget {
  const CustomPrimaryTextButton({
    super.key,
    required this.icon,
    required this.text,
    required this.style,
    required this.onPressed,
    this.padding = 0,
    required this.width,
  });

  final IconData icon;
  final String text;
  final TextStyle style;
  final void Function()? onPressed;
  final double width;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      decoration: buildShadow(
        context,
        Theme.of(context).colorScheme.primaryContainer.withOpacity(0.25),
        20.r,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 25.w,
            vertical: 18.h,
          ),
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
              size: 30.w,
            ),
            SizedBox(
              width: width,
            ),
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(right: padding),
                  child: Text(
                    text,
                    style: style,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
