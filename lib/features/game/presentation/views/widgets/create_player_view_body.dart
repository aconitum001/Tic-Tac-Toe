import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/app_router.dart';
import 'package:tic_tac_toe/core/utils/constants.dart';
import 'package:tic_tac_toe/core/utils/functions/custom_shadow.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/core/widgets/custom_secondary_button.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_carousel_slider.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_text_field.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/default_button_text.dart';
import 'package:tic_tac_toe/features/home/data/models/navigations_param_model.dart';

class CreatePlayerViewBody extends StatefulWidget {
  const CreatePlayerViewBody({super.key, required this.user});
  final UserModel user;

  @override
  State<CreatePlayerViewBody> createState() => _CreatePlayerViewBodyState();
}

class _CreatePlayerViewBodyState extends State<CreatePlayerViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  UserModel friend = UserModel(
    userName: "",
    avatar: avatarsList[0],
    points: 0,
    skinsCollection: [],
    challengesFinished: [],
    selectedSkin: [],
    wins: 0,
    loses: 0,
    draws: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: ListView(
          children: [
            SizedBox(
              height: 129.h,
            ),
            Text(
              "Friend",
              style: AppStyles.style40,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomCarouselSlider(
              user: friend,
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "Select Your Avatar",
              style: AppStyles.style20.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 82.h,
            ),
            CustomTextField(
              onSubmitted: (value) {
                friend.userName = value!;
              },
            ),
            SizedBox(
              height: 29.h,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 36.h),
              decoration: buildShadow(
                context,
                Theme.of(context)
                    .colorScheme
                    .primaryContainer
                    .withOpacity(0.25),
                8.r,
              ),
              child: CustomSecondaryButton(
                bgColor: Theme.of(context).colorScheme.primaryContainer,
                borderColor: Colors.transparent,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    friend.selectedSkin = widget.user.selectedSkin;
                    GoRouter.of(context).push(
                      AppRouter.kGameDuoView,
                      extra: NavigationParams(
                        player1: widget.user,
                        player2: friend,
                        difficulty: "",
                      ),
                    );
                  }
                },
                child: const DefaultText(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
