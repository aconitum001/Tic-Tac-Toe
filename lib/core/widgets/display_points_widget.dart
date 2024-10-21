import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';

class PointsDisplayWidget extends StatelessWidget {
  const PointsDisplayWidget({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33.h,
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 1.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Center(
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            user.points.toString(),
            style: AppStyles.style19.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
