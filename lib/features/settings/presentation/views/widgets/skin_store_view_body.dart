import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/constants.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/custom_skin_store_grid_item.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/skin_store_app_bar.dart';

class SkinStoreViewBody extends StatefulWidget {
  const SkinStoreViewBody({super.key, required this.user});

  final UserModel user;

  @override
  State<SkinStoreViewBody> createState() => _SkinStoreViewBodyState();
}

class _SkinStoreViewBodyState extends State<SkinStoreViewBody> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SkinStoreAppBar(
                user: widget.user,
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
            itemCount: skinsList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 54.w,
              mainAxisSpacing: 40.h,
              childAspectRatio: 113.51.w / 119.94.h,
            ),
            itemBuilder: (context, index) {
              bool containsBothSkins = widget.user.skinsCollection
                      .contains(skinsList[index].xSkin) &&
                  widget.user.skinsCollection.contains(skinsList[index].oSkin);
              return CustomSkinStoreGridItem(
                onButtonPressed: () {
                  buyNewSkinMethode(index, containsBothSkins);
                },
                onTap: () {
                  changeSkinMethode(containsBothSkins, index);
                },
                skin: skinsList[index],
                color: widget.user.selectedSkin[0] == skinsList[index].xSkin &&
                        widget.user.selectedSkin[1] == skinsList[index].oSkin
                    ? Colors.white
                    : Colors.transparent,
                text: displayTextMethode(containsBothSkins, index),
              );
            },
          ),
        ),
      ],
    );
  }

  String displayTextMethode(bool containsBothSkins, int index) {
    return containsBothSkins ? "Free" : skinsList[index].price.toString();
  }

  void changeSkinMethode(bool containsBothSkins, int index) {
    if (containsBothSkins) {
      widget.user.selectedSkin = [
        skinsList[index].xSkin,
        skinsList[index].oSkin
      ];
      widget.user.save();
      setState(() {});
    }
  }

  void buyNewSkinMethode(int index, bool containsBothSkins) {
    if (widget.user.points >= skinsList[index].price && !containsBothSkins) {
      widget.user.points -= skinsList[index].price;
      widget.user.skinsCollection.add(skinsList[index].xSkin);
      widget.user.skinsCollection.add(skinsList[index].oSkin);
      widget.user.save();

      setState(() {});
    }
  }
}
