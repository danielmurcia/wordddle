import 'package:dartz/dartz.dart';
import 'package:wordddle/domain/models/failure.dart';
import 'package:wordddle/domain/models/user_stats.dart';
import 'package:wordddle/domain/stats/repo/stats_repo.dart';

class StatsRepositoryImpl implements StatsRepository {
  StatsRepositoryImpl();

  @override
  Future<Either<Failure, UserStats>> getUserStats() {
    // TODO: implement getUserStats
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> saveGame(int guesses) {
    // TODO: implement saveGame
    throw UnimplementedError();
  }
}
