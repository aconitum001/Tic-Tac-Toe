import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/app_router.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/custom_settings_app_bar.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/custom_settings_text_button.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/edit_profile_section.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/theme_section.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSettingsAppBar(),
          SizedBox(
            height: 40.h,
          ),
          EditProfileSection(
            user: user,
          ),
          SizedBox(
            height: 20.h,
          ),
          const ThemeSection(),
          CustomSettingsTextButton(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kSkinStoreView, extra: user);
            },
            text: "Skin Store",
            icon: Icons.arrow_forward_ios_rounded,
          ),
          SizedBox(
            height: 25.h,
          ),
          CustomSettingsTextButton(
            onTap: () {
              GoRouter.of(context).push(AppRouter.kHistoryView, extra: user);
            },
            text: "Game History",
            icon: Icons.arrow_forward_ios_rounded,
          )
        ],
      ),
    );
  }
}
