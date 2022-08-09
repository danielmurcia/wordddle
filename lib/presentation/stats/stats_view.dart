import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordddle/data/stats/file_handler.dart';
import 'package:wordddle/data/stats/stats_repo_impl.dart';
import 'package:wordddle/domain/models/user_stats.dart';
import 'package:wordddle/domain/stats/bloc/stats_cubit.dart';
import 'package:wordddle/presentation/stats/widgets/guess_distribution_bar.dart';
import 'package:wordddle/presentation/stats/widgets/stats_main_item.dart';

class StatsView extends StatelessWidget {
  const StatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<StatsCubit>(
      create: (_) => StatsCubit(
        // TODO inject dependencies
        StatsRepositoryImpl(FileHandler.instance),
      )..getUserStats(),
      child: _StatsView(),
    );
  }
}

class _StatsView extends StatelessWidget {
  const _StatsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StatsCubit, StatsState>(
      builder: (_, StatsState state) {
        if (state is StatsLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        UserStats stats = state.stats;
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                StatsMainItem(
                  type: StatsMainItemType.played,
                  value: stats.gamesPlayed,
                ),
                StatsMainItem(
                  type: StatsMainItemType.winPercentage,
                  value: stats.winPercentage,
                ),
                StatsMainItem(
                  type: StatsMainItemType.currentStreak,
                  value: stats.currentStreak,
                ),
                StatsMainItem(
                  type: StatsMainItemType.maxStreak,
                  value: stats.maxStreak,
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Column(
              children: [
                Text('Guess distribution'),
                SizedBox(height: 8.0),
                GuessDistributionBar(
                  tries: '1',
                  maxValue: stats.mostGuesses,
                  value: stats.gamesByGuesses[0],
                ),
                GuessDistributionBar(
                  tries: '2',
                  maxValue: stats.mostGuesses,
                  value: stats.gamesByGuesses[1],
                ),
                GuessDistributionBar(
                  tries: '3',
                  maxValue: stats.mostGuesses,
                  value: stats.gamesByGuesses[2],
                ),
                GuessDistributionBar(
                  tries: '4',
                  maxValue: stats.mostGuesses,
                  value: stats.gamesByGuesses[3],
                ),
                GuessDistributionBar(
                  tries: '5',
                  maxValue: stats.mostGuesses,
                  value: stats.gamesByGuesses[4],
                ),
                GuessDistributionBar(
                  tries: '6',
                  maxValue: stats.mostGuesses,
                  value: stats.gamesByGuesses[5],
                ),
                GuessDistributionBar(
                  tries: 'X',
                  maxValue: stats.mostGuesses,
                  value: stats.totalLost,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
