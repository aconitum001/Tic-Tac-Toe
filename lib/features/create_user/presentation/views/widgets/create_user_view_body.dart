import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_carousel_slider.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_create_user_button.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_text_field.dart';

class CreateUserViewBody extends StatefulWidget {
  const CreateUserViewBody({super.key});

  @override
  State<CreateUserViewBody> createState() => _CreateUserViewBodyState();
}

class _CreateUserViewBodyState extends State<CreateUserViewBody> {
  GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late String userName;
  UserModel user = UserModel(
    userName: "",
    avatar: "",
    points: 0,
    skinsCollection: [],
    challengesFinished: [],
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
              "You",
              style: AppStyles.style40,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 50.h,
            ),
            CustomCarouselSlider(
              user: user,
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
                userName = value!;
              },
            ),
            SizedBox(
              height: 29.h,
            ),
            CustomCreatUserButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  user.userName = userName;
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
