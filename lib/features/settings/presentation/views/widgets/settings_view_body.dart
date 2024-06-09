import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/custom_settings_app_bar.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/custom_settings_text_button.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/edit_profile_section.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/theme_section.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

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
          const EditProfileSection(),
          SizedBox(
            height: 20.h,
          ),
          const ThemeSection(),
          const CustomSettingsTextButton(
            text: "Skin Store",
            icon: Icons.arrow_forward_ios_rounded,
          ),
          SizedBox(
            height: 25.h,
          ),
          const CustomSettingsTextButton(
            text: "Game History",
            icon: Icons.arrow_forward_ios_rounded,
          )
        ],
      ),
    );
  }
}
