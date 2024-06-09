import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';

class CustomSettingsAppBar extends StatelessWidget {
  const CustomSettingsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {
            GoRouter.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        Text(
          "Settings",
          style: AppStyles.style17,
        ),
      ],
    );
  }
}
