import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

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
              GoRouter.of(context).pop();
            },
            iconSize: 35.w,
            icon: const Icon(Icons.arrow_back),
          )
        ],
      ),
    );
  }
}
