import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/functions/custom_shadow.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/core/widgets/custom_secondary_button.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_carousel_slider.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_difficulty_app_bar.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_text_field.dart';

class EditProfileViewBody extends StatefulWidget {
  const EditProfileViewBody({super.key, required this.user});

  final UserModel user;

  @override
  State<EditProfileViewBody> createState() => _EditProfileViewBodyState();
}

class _EditProfileViewBodyState extends State<EditProfileViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    controller.text = widget.user.userName;
    return Center(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: ListView(
          children: [
            const CustomGameAppBar(),
            SizedBox(
              height: 50.h,
            ),
            Text(
              "You",
              style: AppStyles.style40,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomCarouselSlider(
              user: widget.user,
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
              controller: controller,
              onSubmitted: (value) {
                widget.user.userName = value!;
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
                  updateUserMethode(context);
                },
                child: Text(
                  "Edit",
                  style: AppStyles.style20.copyWith(
                    color: Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void updateUserMethode(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      widget.user.save();
      GoRouter.of(context).pop();
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
