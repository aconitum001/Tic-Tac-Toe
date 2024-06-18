import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/display_user_stats.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/game_history_list_view_item.dart';
import 'package:tic_tac_toe/features/settings/presentation/views/widgets/skin_store_app_bar.dart';

class HistoryViewBody extends StatefulWidget {
  const HistoryViewBody({super.key, required this.user});

  final UserModel user;

  @override
  State<HistoryViewBody> createState() => _HistoryViewBodyState();
}

class _HistoryViewBodyState extends State<HistoryViewBody> {
  bool startAnimation = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        setState(() {
          startAnimation = true;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SkinStoreAppBar(user: widget.user),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Game History",
                style: AppStyles.style40,
              ),
              const DisplayUserStatsSection(),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
        SliverList.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return GameHistoryListViewItem(
              index: index,
              startAnimation: startAnimation,
            );
          },
        )
      ],
    );
  }
}
