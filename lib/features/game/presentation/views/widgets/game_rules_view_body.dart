import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'game_rules_section.dart';

class GameRulesViewBody extends StatelessWidget {
  const GameRulesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomArrowAppBar(),
        SizedBox(
          height: 30.h,
        ),
        const GameRulesSection()
      ],
    );
  }
}

class CustomArrowAppBar extends StatelessWidget {
  const CustomArrowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            iconSize: 35.w,
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      ),
    );
  }
}
