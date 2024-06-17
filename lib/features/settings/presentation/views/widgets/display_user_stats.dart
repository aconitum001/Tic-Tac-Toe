import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/stats_widget.dart';

class DisplayUserStatsSection extends StatelessWidget {
  const DisplayUserStatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const StatsWidget(
          text: "Wins",
          number: 0,
        ),
        SizedBox(
          height: 24.h,
          child: VerticalDivider(
            width: 70.w,
            thickness: 1,
          ),
        ),
        const StatsWidget(
          text: "Loses",
          number: 0,
        ),
        SizedBox(
          height: 24.h,
          child: VerticalDivider(
            width: 70.w,
            thickness: 1,
          ),
        ),
        const StatsWidget(
          text: "Draws",
          number: 0,
        ),
      ],
    );
  }
}
