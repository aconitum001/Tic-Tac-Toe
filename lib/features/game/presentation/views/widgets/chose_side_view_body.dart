import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/app_router.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/core/widgets/custom_secondary_button.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_difficulty_app_bar.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/chose_side_section.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/display_players_section.dart';
import 'package:tic_tac_toe/features/home/data/models/navigations_param_model.dart';

class ChoseSideViewBody extends StatefulWidget {
  const ChoseSideViewBody({
    super.key,
    required this.player1,
    required this.player2,
  });

  final UserModel player1, player2;

  @override
  State<ChoseSideViewBody> createState() => _ChoseSideViewBodyState();
}

class _ChoseSideViewBodyState extends State<ChoseSideViewBody> {
  late List<String> selectedSkins;

  @override
  void initState() {
    super.initState();
    selectedSkins = widget.player1.selectedSkin.reversed.toList();
  }

  void updateSelectedSkins(List<String> newSelectedSkins) {
    selectedSkins = newSelectedSkins;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const CustomGameAppBar(),
        SizedBox(
          height: 15.h,
        ),
        Center(
          child: Text(
            "Choose Your Side",
            style: AppStyles.style35,
          ),
        ),
        SizedBox(
          height: 27.h,
        ),
        DisplayPlayersSection(
          player1: widget.player1,
          player2: widget.player2,
        ),
        SizedBox(
          height: 33.h,
        ),
        ChoseSideSection(
          skins: widget.player1.selectedSkin,
          onOptionChanged: updateSelectedSkins,
        ),
        SizedBox(
          height: 67.h,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: CustomSecondaryButton(
            onPressed: () {
              GoRouter.of(context).push(
                AppRouter.kGameDuoView,
                extra: NavigationParams(
                  player1: widget.player1,
                  player2: widget.player2,
                  selectedSkins: selectedSkins,
                  difficulty: "",
                ),
              );
            },
            bgColor: Theme.of(context).colorScheme.primaryContainer,
            borderColor: Colors.transparent,
            child: Text(
              "Next",
              style: AppStyles.style20.copyWith(
                fontWeight: FontWeight.w600,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
            ),
          ),
        )
      ],
    );
  }
}
