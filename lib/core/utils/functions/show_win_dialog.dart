import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';

void showConfetti(ConfettiController controller) {
  controller.play();
}

void showGameResults(
  BuildContext context,
  ConfettiController controller,
  String title,
  Color titleColor,
  Color bgColor,
  String animation,
  bool animate,
  bool showanimation,
) {
  showDialog(
    context: context,
    builder: (context) {
      if (showanimation) {
        showConfetti(controller);
      }

      return Stack(
        children: [
          AlertDialog(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            title: Center(
              child: Text(
                title,
                style: AppStyles.style25.copyWith(
                  color: titleColor,
                ),
              ),
            ),
            content: Container(
              decoration: BoxDecoration(
                color: bgColor,
                shape: BoxShape.circle,
              ),
              child: Lottie.asset(
                animation,
                repeat: animate,
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      fixedSize: Size(120.w, 29.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20.r,
                        ),
                      ),
                      backgroundColor: titleColor,
                    ),
                    onPressed: () {
                      GoRouter.of(context).pop();
                    },
                    child: Text(
                      'Back',
                      style: AppStyles.style14.copyWith(
                        color: Theme.of(context).colorScheme.primaryContainer,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: ConfettiWidget(
              confettiController: controller,
              blastDirectionality: BlastDirectionality.explosive,
              shouldLoop: true,
              colors: const [
                Colors.red,
                Colors.yellow,
                Colors.green,
                Colors.purple,
                Colors.pink,
                Colors.orange,
              ],
            ),
          )
        ],
      );
    },
  );
}
