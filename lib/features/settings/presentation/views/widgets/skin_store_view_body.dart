import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/constants.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/home/presentation/view_model/user_cubit/user_cubit.dart';
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
          sliver: AnimationLimiter(
            child: SliverGrid.builder(
              itemCount: skinsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 54.w,
                mainAxisSpacing: 40.h,
                childAspectRatio: 113.51.w / 119.94.h,
              ),
              itemBuilder: (context, index) {
                bool isLocked = true;
                bool containsBothSkins = widget.user.skinsCollection
                        .contains(skinsList[index].xSkin) &&
                    widget.user.skinsCollection
                        .contains(skinsList[index].oSkin);
                if (widget.user.unlockedSkins.contains(index)) {
                  isLocked = false;
                }
                return AnimationConfiguration.staggeredGrid(
                  position: index,
                  columnCount: 2,
                  duration: const Duration(seconds: 1),
                  child: ScaleAnimation(
                    child: CustomSkinStoreGridItem(
                      onButtonPressed: () {
                        if (!isLocked) {
                          buyNewSkinMethode(index, containsBothSkins);
                        }
                      },
                      onTap: () {
                        if (!isLocked) {
                          changeSkinMethode(containsBothSkins, index);
                        }
                      },
                      skin: skinsList[index],
                      color: widget.user.selectedSkin[0] ==
                                  skinsList[index].xSkin &&
                              widget.user.selectedSkin[1] ==
                                  skinsList[index].oSkin
                          ? Colors.white
                          : Colors.transparent,
                      text: displayTextMethode(containsBothSkins, index),
                      isLocked: isLocked,
                    ),
                  ),
                );
              },
            ),
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
      widget.user.skinsCollection.add(skinsList[index].xSkin);
      widget.user.skinsCollection.add(skinsList[index].oSkin);
      BlocProvider.of<UserCubit>(context)
          .updateUserPoints(points: -skinsList[index].price, user: widget.user);
      setState(() {});
      showNewSkinDialog(index);
    }
  }

  void showNewSkinDialog(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          contentPadding: EdgeInsets.symmetric(
            vertical: 20.h,
          ),
          title: Center(
            child: Text(
              "Congratulations!!",
              style: AppStyles.style25.copyWith(
                color: xColors[index],
              ),
            ),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                skinsList[index].xSkin,
                width: 110.w,
                height: 118.h,
              ),
              SvgPicture.asset(
                skinsList[index].oSkin,
                width: 110.w,
                height: 118.h,
              ),
            ],
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    backgroundColor: xColors[index],
                  ),
                  onPressed: () {
                    GoRouter.of(context).pop();
                    widget.user.selectedSkin = [
                      skinsList[index].xSkin,
                      skinsList[index].oSkin
                    ];
                    widget.user.save();
                    setState(() {});
                  },
                  child: Text(
                    'Equip your new skin',
                    style: AppStyles.style14.copyWith(
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
