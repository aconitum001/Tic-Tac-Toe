import 'package:flutter/material.dart';
import 'package:tic_tac_toe/core/utils/assets.dart';
import 'package:tic_tac_toe/features/splash/presentation/views/widgets/get_started_view_body.dart';

class GetStartedView extends StatelessWidget {
  const GetStartedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.primaryDarkBackground),
          fit: BoxFit.fill,
        ),
      ),
      child: const Scaffold(
        body: GetStartedViewBody(),
      ),
    );
  }
}
