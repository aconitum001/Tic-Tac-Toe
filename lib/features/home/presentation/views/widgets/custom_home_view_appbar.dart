import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/home/presentation/view_model/user_cubit/user_cubit.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 48.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white)),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.volume_up_outlined),
              ),
            ),
            Container(
              height: 33.h,
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                border: Border.all(
                  color: Colors.white,
                ),
              ),
              child: Center(
                child: Text(
                  user.points.toString(),
                  style: AppStyles.style19.copyWith(
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
