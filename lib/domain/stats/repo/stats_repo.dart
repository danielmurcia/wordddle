import 'package:dartz/dartz.dart';
import 'package:wordddle/domain/models/failure.dart';
import 'package:wordddle/domain/models/user_stats.dart';

abstract class StatsRepository {
  Future<Either<Failure, UserStats>> getUserStats();
  Future<Either<Failure, bool>> saveGame(UserStats stats);
}
