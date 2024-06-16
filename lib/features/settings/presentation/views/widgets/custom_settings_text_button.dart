import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';

class CustomSettingsTextButton extends StatelessWidget {
  const CustomSettingsTextButton({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });
  final String text;
  final IconData icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 125.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Opacity(
              opacity: .5,
              child: Text(
                text,
                style: AppStyles.style15.copyWith(
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
              ),
            ),
            Icon(
              icon,
              size: 18.w,
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.5),
            )
          ],
        ),
      ),
    );
  }
}
