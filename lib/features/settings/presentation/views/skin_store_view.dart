import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/constants.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/skin_store_view_body.dart';

class SkinStoreView extends StatefulWidget {
  const SkinStoreView({
    super.key,
    required this.user,
    required this.skinIndex,
  });

  final UserModel user;
  final int skinIndex;

  @override
  State<SkinStoreView> createState() => _SkinStoreViewState();
}

class _SkinStoreViewState extends State<SkinStoreView> {
  @override
  void initState() {
    super.initState();
    if (widget.skinIndex != -1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
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
                    color: xColors[widget.skinIndex],
                  ),
                ),
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    skinsList[widget.skinIndex].xSkin,
                    width: 110.w,
                    height: 118.h,
                  ),
                  SvgPicture.asset(
                    skinsList[widget.skinIndex].oSkin,
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
                        backgroundColor: xColors[widget.skinIndex],
                      ),
                      onPressed: () {
                        GoRouter.of(context).pop();
                      },
                      child: Text(
                        'Get your new skin',
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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.twoStarDarkBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          body: SkinStoreViewBody(
            user: widget.user,
          ),
        ),
      ),
    );
  }
}
