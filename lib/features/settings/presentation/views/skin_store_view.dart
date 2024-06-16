import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/skin_store_view_body.dart';

class SkinStoreView extends StatelessWidget {
  const SkinStoreView({super.key, required this.user});

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.twoStarDarkBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        body: SkinStoreViewBody(
          user: user,
        ),
      ),
    );
  }
}
