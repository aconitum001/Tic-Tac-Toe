import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/app_router.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/functions/custom_shadow.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/core/widgets/custom_text_button.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_loading_widget.dart';
import 'package:tic_tac_toe/features/home/presentation/view_models/get_user_cubit/get_user_cubit.dart';
import 'package:tic_tac_toe/features/home/presentation/views/widgets/custom_home_view_appbar.dart';
import 'package:tic_tac_toe/features/home/presentation/views/widgets/home_buttons_section.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<GetUserCubit>(context).getUser();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetUserCubit, GetUserState>(
      builder: (context, state) {
        if (state is GetUserSuccess) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            child: Column(
              children: [
                CustomAppBar(
                  user: state.user,
                ),
                SizedBox(
                  height: 40.h,
                ),
                SvgPicture.asset(AppAssets.logo),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Tic-Tac-Toe",
                  style: AppStyles.style40.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                HomeButtonsSection(
                  user: state.user,
                ),
                SizedBox(
                  height: 69.h,
                ),
                Container(
                  decoration: buildShadow(
                    context,
                    Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.25),
                    20.r,
                  ),
                  child: CustomTextButton(
                    onPressed: () {
                      GoRouter.of(context).push(
                        AppRouter.kSettingsView,
                        extra: state.user,
                      );
                    },
                    text: "Settings",
                    backgroundColor: [
                      Theme.of(context).colorScheme.secondary,
                      Theme.of(context).colorScheme.onSecondary,
                    ],
                    textColor: Theme.of(context).colorScheme.primaryContainer,
                    style: AppStyles.style20.copyWith(
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).colorScheme.primaryContainer,
                    ),
                  ),
                )
              ],
            ),
          );
        } else if (state is GetUserFailure) {
          return Text(state.errMessage);
        } else {
          return const CustomLoadingWidget(
            color: Colors.white,
          );
        }
      },
    );
  }
}
