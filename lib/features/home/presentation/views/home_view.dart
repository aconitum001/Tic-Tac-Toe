import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/features/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage(AppAssets.primaryDarkBackground),
        fit: BoxFit.fill,
      )),
      child: const SafeArea(
        child: Scaffold(
          body: HomeViewBody(),
        ),
      ),
    );
  }
}
