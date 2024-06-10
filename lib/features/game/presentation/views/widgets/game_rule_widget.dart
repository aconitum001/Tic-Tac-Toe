import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';

class GameRuleWidget extends StatelessWidget {
  const GameRuleWidget(
      {super.key,
      required this.title,
      required this.subtitle1,
      required this.subtitle2,
      required this.image,
      required this.scale,
      required this.space});
  final String title, subtitle1, subtitle2, image;
  final double scale, space;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          image,
          scale: scale,
        ),
        SizedBox(
          width: space,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppStyles.style30,
            ),
            Text(
              subtitle1,
              style: AppStyles.style15,
            ),
            Text(
              subtitle2,
              style: AppStyles.style15,
            )
          ],
        )
      ],
    );
  }
}
