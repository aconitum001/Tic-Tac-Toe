import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/custom_skin_store_grid_item.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/skin_store_app_bar.dart';

class SkinStoreViewBody extends StatelessWidget {
  const SkinStoreViewBody({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SkinStoreAppBar(
                user: user,
              ),
              Text(
                "Skin Store",
                style: AppStyles.style35,
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 70.w),
          sliver: SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 54.w,
              mainAxisSpacing: 40.h,
              childAspectRatio: 113.51.w / 119.94.h,
            ),
            itemBuilder: (context, index) {
              return const CustomSkinStoreGridItem(
                oImage: AppAssets.oStyle1,
                xImage: AppAssets.xStyle1,
                text: "Free",
              );
            },
          ),
        )
      ],
    );
  }
}
