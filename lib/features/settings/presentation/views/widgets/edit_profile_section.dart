import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/app_router.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/custom_edit_button.dart';

class EditProfileSection extends StatelessWidget {
  const EditProfileSection({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Opacity(
          opacity: .5,
          child: Text(
            "Profile",
            style: AppStyles.style15,
          ),
        ),
        Center(
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Theme.of(context).colorScheme.primaryContainer,
                width: 4,
              ),
            ),
            child: Image.asset(
              user.avatar,
              width: 100.w,
              height: 100.h,
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        Center(
          child: Text(
            user.userName,
            style: AppStyles.style15.copyWith(
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        SizedBox(
          height: 11.h,
        ),
        CustomEditButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kEditProfileView, extra: user);
          },
        )
      ],
    );
  }
}
