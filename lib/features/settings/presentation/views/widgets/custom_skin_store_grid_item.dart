import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_grid_view_button.dart';
import 'package:tic_tac_toe/features/settings/data/models/skin_model.dart';

class CustomSkinStoreGridItem extends StatelessWidget {
  const CustomSkinStoreGridItem({
    super.key,
    required this.skin,
  });

  final SkinModel skin;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 8.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(21.42.r),
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                skin.xSkin,
                width: 45.w,
                height: 45.h,
              ),
              SizedBox(
                width: 2.w,
              ),
              SvgPicture.asset(
                skin.oSkin,
                width: 45.w,
                height: 45.h,
              ),
            ],
          ),
          CustomGridViewButton(
            onPressed: () {},
            text: skin.price == 0 ? "Free" : skin.price.toString(),
          )
        ],
      ),
    );
  }
}
