import 'package:dartz/dartz.dart';
import 'package:wordddle/data/stats/file_handler.dart';
import 'package:wordddle/domain/models/failure.dart';
import 'package:wordddle/domain/models/user_stats.dart';
import 'package:wordddle/domain/stats/repo/stats_repo.dart';

class StatsRepositoryImpl implements StatsRepository {
  StatsRepositoryImpl(this.fileHandler);

  final FileHandler fileHandler;

  @override
  Future<Either<Failure, UserStats>> getUserStats() async {
    UserStats? stats = await fileHandler.readStats();
    return stats != null ? right(stats) : left(Failure('No data found'));
  }

  @override
  Future<Either<Failure, bool>> saveGame(UserStats stats) async {
    await fileHandler.writeStats(stats);
    return right(true);
  }
}
