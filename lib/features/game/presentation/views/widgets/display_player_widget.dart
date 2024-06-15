import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';

class DisplayPlayerWidget extends StatelessWidget {
  const DisplayPlayerWidget({
    super.key,
    required this.userName,
    required this.avatar,
  });
  final String userName;

  final String avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 121.w,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  width: 3,
                ),
              ),
              child: Image.asset(
                avatar,
                width: 73.w,
                height: 73.h,
              ),
            ),
            SizedBox(
              child: Divider(
                color: Theme.of(context).colorScheme.primaryContainer,
              ),
            ),
            Center(
              child: Text(
                userName,
                style: AppStyles.style15.copyWith(
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
