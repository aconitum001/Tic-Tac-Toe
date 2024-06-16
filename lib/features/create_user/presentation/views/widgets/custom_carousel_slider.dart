import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/constants.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
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
              width: 138.5.w,
              height: 138.5.h,
            ),
          );
        },
      ).toList(),
      options: CarouselOptions(
        onPageChanged: (index, reason) {
          widget.user.avatar = avatarsList[index];
        },
        initialPage: avatarsList.indexOf(widget.user.avatar),
        enlargeCenterPage: true,
        disableCenter: false,
        height: 138.h,
        pauseAutoPlayOnTouch: true,
        viewportFraction: 0.3,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        clipBehavior: Clip.none,
      ),
    );
  }
}
