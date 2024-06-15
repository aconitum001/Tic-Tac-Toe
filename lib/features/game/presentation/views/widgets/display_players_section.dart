import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/display_player_widget.dart';

class DisplayPlayersSection extends StatelessWidget {
  const DisplayPlayersSection({
    super.key,
    required this.player1,
    required this.player2,
  });

  final UserModel player1;
  final UserModel player2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DisplayPlayerWidget(
            userName: player1.userName,
            avatar: player1.avatar,
          ),
          DisplayPlayerWidget(
            userName: player2.userName,
            avatar: player2.avatar,
          )
        ],
      ),
    );
  }
}
