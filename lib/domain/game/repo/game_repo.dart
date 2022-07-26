import 'package:dartz/dartz.dart';
import 'package:wordddle/domain/models/failure.dart';

abstract class GameRepository {
  String getWordOfTheDay();
  Future<Either<Failure, bool>> wordExists(String word);
}
