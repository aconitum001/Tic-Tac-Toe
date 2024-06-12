import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/core/widgets/custom_secondary_button.dart';

class GameDifficultyButtonsSection extends StatefulWidget {
  const GameDifficultyButtonsSection({
    super.key,
    required this.selectedDifficulty,
    required this.onDifficultySelected,
  });

  final int selectedDifficulty;
  final Function(int) onDifficultySelected;

  @override
  State<GameDifficultyButtonsSection> createState() =>
      _GameDifficultyButtonsSectionState();
}

class _GameDifficultyButtonsSectionState
    extends State<GameDifficultyButtonsSection> {
  late int selectedDifficulty;

  @override
  void initState() {
    super.initState();
    selectedDifficulty = widget.selectedDifficulty;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomSecondaryButton(
            onPressed: () {
              setState(() {
                selectedDifficulty = 0;
                widget.onDifficultySelected(selectedDifficulty);
              });
            },
            bgColor: Colors.red,
            borderColor:
                selectedDifficulty == 0 ? Colors.white : Colors.transparent,
            child: Center(
              child: Text(
                "Hard",
                style: AppStyles.style23.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomSecondaryButton(
            onPressed: () {
              setState(() {
                selectedDifficulty = 1;
                widget.onDifficultySelected(selectedDifficulty);
              });
            },
            bgColor: const Color(0xffFBB38B),
            borderColor:
                selectedDifficulty == 1 ? Colors.white : Colors.transparent,
            child: Center(
              child: Text(
                "Medium",
                style: AppStyles.style23.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          CustomSecondaryButton(
            onPressed: () {
              setState(() {
                selectedDifficulty = 2;
                widget.onDifficultySelected(selectedDifficulty);
              });
            },
            bgColor: const Color(0xffA4D3A0),
            borderColor:
                selectedDifficulty == 2 ? Colors.white : Colors.transparent,
            child: Center(
              child: Text(
                "Easy",
                style: AppStyles.style23.copyWith(
                  color: Theme.of(context).colorScheme.onSecondaryContainer,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
