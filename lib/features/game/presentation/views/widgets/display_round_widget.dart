import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';

class DisplayRoundsWidget extends StatelessWidget {
  const DisplayRoundsWidget({
    super.key,
    required this.counter,
    required this.rounds,
  });

  final int counter, rounds;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 25.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Center(
        child: Text(
          counter <= rounds ? "$counter/$rounds" : "$rounds/$rounds",
          style: AppStyles.style19.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
