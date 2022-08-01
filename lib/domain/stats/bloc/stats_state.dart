part of 'stats_cubit.dart';

abstract class StatsState extends Equatable {
  const StatsState(this.stats);

  final UserStats stats;

  @override
  List<Object?> get props => [stats];
}

class StatsLoading extends StatsState {
  StatsLoading()
      : super(
          UserStats(
            gamesPlayed: 0,
            totalWins: 0,
            currentStreak: 0,
            maxStreak: 0,
            gamesByGuesses: [0, 0, 0, 0, 0, 0],
          ),
        );
}

class StatsLoaded extends StatsState {
  StatsLoaded(stats) : super(stats);
}
