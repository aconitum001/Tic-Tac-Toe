import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/stats_widget.dart';

class DisplayUserStatsSection extends StatelessWidget {
  const DisplayUserStatsSection({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StatsWidget(
          text: "Wins",
          number: user.wins,
        ),
        SizedBox(
          height: 24.h,
          child: VerticalDivider(
            width: 70.w,
            thickness: 1,
          ),
        ),
        StatsWidget(
          text: "Loses",
          number: user.loses,
        ),
        SizedBox(
          height: 24.h,
          child: VerticalDivider(
            width: 70.w,
            thickness: 1,
          ),
        ),
        StatsWidget(
          text: "Draws",
          number: user.draws,
        ),
      ],
    );
  }
}
