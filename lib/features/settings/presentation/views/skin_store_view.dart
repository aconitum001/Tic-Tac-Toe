import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/constants.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/home/presentation/view_model/user_cubit/user_cubit.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/skin_store_view_body.dart';

class SkinStoreView extends StatelessWidget {
  const SkinStoreView({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is GetUserNewSkin) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                contentPadding: EdgeInsets.zero,
                title: Center(
                  child: Text(
                    "Congratulations!!",
                    style: AppStyles.style25.copyWith(
                      color: const Color(0xffFF7D29),
                    ),
                  ),
                ),
                content: Row(
                  children: [
                    SvgPicture.asset(
                      skinsList[state.skinIndex].xSkin,
                      width: 110.w,
                      height: 118.h,
                    ),
                    SvgPicture.asset(
                      skinsList[state.skinIndex].oSkin,
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
                            borderRadius: BorderRadius.circular(
                              20.r,
                            ),
                          ),
                          backgroundColor: const Color(0xffFF7D29),
                        ),
                        onPressed: () {
                          GoRouter.of(context).pop();
                        },
                        child: Text(
                          'Get your new skin',
                          style: AppStyles.style14.copyWith(
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
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
      },
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.twoStarDarkBackground),
            fit: BoxFit.fill,
          ),
        ),
        child: SafeArea(
          child: Scaffold(
            body: SkinStoreViewBody(
              user: user,
            ),
          ),
        ),
      ),
    );
  }
}
