import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tic_tac_toe/core/utils/app_router.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/constants.dart';
import 'package:tic_tac_toe/core/utils/functions/custom_shadow.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/prefrences_service.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/create_user/presentation/view_model/add_user_cubit/add_user_cubit.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_carousel_slider.dart';
import 'package:tic_tac_toe/core/widgets/custom_secondary_button.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_loading_widget.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/custom_text_field.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/default_button_text.dart';

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
    avatar: avatarsList[0],
    points: 0,
    skinsCollection: [],
    challengesFinished: [],
    selectedSkin: [AppAssets.xStyle1, AppAssets.oStyle1],
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
            BlocConsumer<AddUserCubit, AddUserState>(
              listener: (context, state) {
                if (state is AddUserSuccess) {
                  GoRouter.of(context).push(AppRouter.kHomeView);
                } else if (state is AddUserFailure) {
                  debugPrint(state.errMessage);
                }
              },
              builder: (context, state) {
                return Container(
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
                      addUserMethode(context);
                    },
                    child: state is AddUserLoading
                        ? const CustomLoadingWidget()
                        : const DefaultText(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }

  void addUserMethode(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      user.userName = userName;
      await PrefrencesService.setFirstLaunch(firstLaunch: false);
      BlocProvider.of<AddUserCubit>(context).adduser(user: user);
    } else {
      autovalidateMode = AutovalidateMode.always;
      setState(() {});
    }
  }
}
