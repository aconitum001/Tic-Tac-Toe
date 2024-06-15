import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/app_router.dart';

class CustomGameViewAppBar extends StatelessWidget {
  const CustomGameViewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
            },
            iconSize: 35.w,
            icon: const Icon(Icons.arrow_back),
          )
        ],
      ),
    );
  }
}
