part of 'game_cubit.dart';

abstract class GameState extends Equatable {
  const GameState(
    this.tries,
    this.currentWord,
    this.incorrectLetters,
  );

  final List<WordGuess> tries;
  final String currentWord;
  final Set<String> incorrectLetters;

  @override
  List<Object?> get props => [tries, currentWord, incorrectLetters];
}

class GameLoading extends GameState {
  GameLoading() : super([], '', Set());
}

class GameNextTry extends GameState {
  GameNextTry(
      List<WordGuess> tries, String currentWord, Set<String> incorrectLetters)
      : super(tries, currentWord, incorrectLetters);
}

class GameWon extends GameState {
  GameWon(List<WordGuess> tries, Set<String> incorrectLetters)
      : super(tries, '', incorrectLetters);
}

class GameOver extends GameState {
  GameOver(List<WordGuess> tries, Set<String> incorrectLetters)
      : super(tries, '', incorrectLetters);
}

class NonExistentWord extends GameState {
  NonExistentWord(List<WordGuess> tries, Set<String> incorrectLetters)
      : super(tries, '', incorrectLetters);
}
