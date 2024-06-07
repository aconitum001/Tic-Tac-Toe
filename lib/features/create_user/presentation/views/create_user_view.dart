import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/features/create_user/presentation/views/widgets/create_user_view_body.dart';

class CreateUserView extends StatelessWidget {
  const CreateUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.secoundaryDarkBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: const Scaffold(
        resizeToAvoidBottomInset: true,
        body: CreateUserViewBody(),
      ),
    );
  }
}
