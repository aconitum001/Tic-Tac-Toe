import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            AppAssets.secoundaryDarkBackground,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        body: EditProfileViewBody(user: user),
      ),
    );
  }
}
