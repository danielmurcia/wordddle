import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wordddle/domain/models/user_stats.dart';

part 'stats_state.dart';

class StatsCubit extends Cubit<StatsState> {
  StatsCubit() : super(StatsLoading());

  void getUserStats() {
    UserStats stats = UserStats(
      gamesPlayed: 10,
      totalWins: 7,
      currentStreak: 3,
      maxStreak: 4,
      gamesByGuesses: [0, 2, 3, 1, 0, 1],
    );

    emit(StatsLoaded(stats));
  }

  void saveGame(bool won, int guesses) {
    UserStats stats = state.stats.addGame(won, guesses);
    // TODO Save stats
    emit(StatsLoaded(stats));
  }
}
