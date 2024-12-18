import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tic_tac_toe/core/utils/models/user_model.dart';
import 'package:tic_tac_toe/core/utils/styles.dart';
import 'package:tic_tac_toe/features/settings/data/models/game_history_model.dart';
import 'package:tic_tac_toe/features/settings/presentation/view_model/game_history_cubit/game_history_cubit.dart';
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
  late List<GameHistoryModel> historyList;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<GameHistoryCubit>(context).getHistory();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameHistoryCubit, GameHistoryState>(
      builder: (context, state) {
        if (state is GameHistoryLoaded) {
          historyList = state.historyList.reversed.toList();

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                SkinStoreAppBar(user: widget.user),
                SizedBox(height: 10.h),
                Text(
                  "Game History",
                  style: AppStyles.style40,
                ),
                DisplayUserStatsSection(
                  user: widget.user,
                ),
                SizedBox(height: 20.h),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: historyList.length,
                  itemBuilder: (context, index) {
                    return GameHistoryListViewItem(
                      length: historyList.length,
                      key: ValueKey<int>(index),
                      index: index,
                      historyModel: historyList[index],
                    );
                  },
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          );
        }
      },
    );
  }
}
