import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';

class StatsWidget extends StatelessWidget {
  const StatsWidget({
    super.key,
    required this.number,
    required this.text,
  });

  final int number;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          number.toString(),
          style: AppStyles.style24,
        ),
        Text(
          text,
          style: AppStyles.style13,
        )
      ],
    );
  }
}
