import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/splash/presentation/views/widgets/player_info_widget.dart';

class DisplayPlayersInfoSection extends StatelessWidget {
  const DisplayPlayersInfoSection({
    super.key,
    required this.player1,
    required this.player2,
    required this.player1Points,
    required this.player2Points,
  });
  final UserModel player1, player2;
  final int player1Points, player2Points;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PlayerInfoWidget(
            avatar: player1.avatar,
            userName: player1.userName,
            points: player1Points,
          ),
          SvgPicture.asset(
            AppAssets.xStyle1,
            width: 30.w,
            height: 30.h,
          ),
          Text(
            ":",
            style: AppStyles.style30,
          ),
          SvgPicture.asset(
            AppAssets.oStyle1,
            width: 30.w,
            height: 30.h,
          ),
          PlayerInfoWidget(
            avatar: player2.avatar,
            userName: player2.userName,
            points: player2Points,
          ),
        ],
      ),
    );
  }
}
