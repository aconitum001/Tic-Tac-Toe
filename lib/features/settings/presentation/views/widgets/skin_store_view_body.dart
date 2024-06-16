import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/skin_store_app_bar.dart';

class SkinStoreViewBody extends StatelessWidget {
  const SkinStoreViewBody({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SkinStoreAppBar(
          user: user,
        ),
      ],
    );
  }
}
