import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/constants.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: avatarsList.map(
        (e) {
          return Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 3,
                color: Colors.white,
              ),
            ),
            child: Image.asset(
              e,
              width: 138,
              height: 138,
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        initialPage: 0,
        enlargeCenterPage: true,
        disableCenter: false,
        height: 138.h,
        viewportFraction: 0.3,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        clipBehavior: Clip.none,
      ),
    );
  }
}
