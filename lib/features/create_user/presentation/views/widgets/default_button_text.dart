import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';

class DefaultText extends StatelessWidget {
  const DefaultText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Next",
      style: AppStyles.style20.copyWith(
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
    );
  }
}
