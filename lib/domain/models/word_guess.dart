import 'package:wordddle/domain/models/letter_guess.dart';

class WordGuess {
  WordGuess(this.letters, this.incorrectLetters);

  final List<LetterGuess> letters;
  final Set<String> incorrectLetters;

  factory WordGuess.build({
    required String guess,
    required String wordToGuess,
  }) {
    //  TODO: NOTE: Check for pros/cons of using asserts
    assert(guess.length == wordToGuess.length);
    List<LetterGuess> letters = [];
    Set<String> incorrectLetters = Set();
    for (int i = 0; i < guess.length; i++) {
      GuessResponse response = (guess[i] == wordToGuess[i])
          ? GuessResponse.sink
          : (wordToGuess.contains(guess[i]))
              ? GuessResponse.hit
              : GuessResponse.notFound;
      if (response == GuessResponse.notFound) {
        incorrectLetters.add(guess[i]);
      }
      letters.add(LetterGuess(guess[i], response));
    }
    return WordGuess(letters, incorrectLetters);
  }

  factory WordGuess.unchecked(String s) {
    List<LetterGuess> letters = s
        .split('')
        .map((String letter) => LetterGuess(letter, GuessResponse.unknown))
        .toList();
    return WordGuess(letters, Set());
  }

  String get word =>
      letters.map((LetterGuess letter) => letter.letter).toList().join();

  bool get winningWord =>
      !letters.any((LetterGuess letter) => letter.guess != GuessResponse.sink);
}
