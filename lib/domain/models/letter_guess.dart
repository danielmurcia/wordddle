enum GuessResponse { unknown, notFound, hit, sink }

class LetterGuess {
  LetterGuess(this.letter, this.guess);

  final String letter;
  final GuessResponse guess;
}
