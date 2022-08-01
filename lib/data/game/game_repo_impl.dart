import 'package:dartz/dartz.dart';
import 'package:wordddle/data/game/game_api.dart';
import 'package:wordddle/data/game/words.dart';
import 'package:wordddle/domain/game/repo/game_repo.dart';
import 'package:wordddle/domain/models/failure.dart';

class GameRepositoryImpl implements GameRepository {
  GameRepositoryImpl(this._api);

  final GameApi _api;

  @override
  String getWordOfTheDay() => Words.wordOfTheDay;

  @override
  Future<Either<Failure, bool>> wordExists(String word) {
    return _api.checkWordExistence(word);
  }
}
