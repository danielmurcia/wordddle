import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wordddle/domain/models/failure.dart';
import 'package:wordddle/domain/models/user_stats.dart';
import 'package:wordddle/domain/stats/repo/stats_repo.dart';

part 'stats_state.dart';

class StatsCubit extends Cubit<StatsState> {
  StatsCubit(this.repo) : super(StatsLoading());

  final StatsRepository repo;

  void getUserStats() async {
    Either<Failure, UserStats> response = await repo.getUserStats();

    response.fold(
      (Failure l) {
        UserStats stats = UserStats(
          userId: '0',
          gamesPlayed: 0,
          totalWins: 0,
          currentStreak: 0,
          maxStreak: 0,
          gamesByGuesses: [0, 0, 0, 0, 0, 0],
        );
        emit(StatsLoaded(stats));
      },
      (UserStats stats) => emit(StatsLoaded(stats)),
    );
  }

  Future<void> saveGame(bool won, int guesses) async {
    emit(StatsLoading());
    UserStats stats = state.stats.addGame(won, guesses);
    await repo.saveGame(stats);
    emit(StatsLoaded(stats));
  }
}
