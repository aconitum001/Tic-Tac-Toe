import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/features/game/presentation/views/widgets/create_player_view_body.dart';

class CreatePlayerView extends StatelessWidget {
  const CreatePlayerView({super.key});

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
        body: CreatePlayerViewBody(),
      ),
    );
  }
}
