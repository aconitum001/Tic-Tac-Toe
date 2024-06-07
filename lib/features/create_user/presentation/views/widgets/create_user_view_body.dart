import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_carousel_slider.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_create_user_button.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_text_field.dart';

class CreateUserViewBody extends StatelessWidget {
  const CreateUserViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          SizedBox(
            height: 129.h,
          ),
          Text(
            "You",
            style: AppStyles.style40,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 40.h,
          ),
          const CustomCarouselSlider(),
          SizedBox(
            height: 15.h,
          ),
          Text(
            "Select Your Avatar",
            style: AppStyles.style20.copyWith(
              fontWeight: FontWeight.w500,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 90.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: SizedBox(
              width: 359.w,
              height: 54.h,
              child: const CustomTextField(),
            ),
          ),
          SizedBox(
            height: 29.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.w),
            child: const CustomCreatUserButton(),
          )
        ],
      ),
    );
  }
}
