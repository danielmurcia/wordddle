import 'dart:math';

class UserStats {
  UserStats({
    required this.gamesPlayed,
    required this.totalWins,
    required this.currentStreak,
    required this.maxStreak,
    required this.gamesByGuesses,
  })  : assert(gamesByGuesses.length == 6),
        assert(gamesByGuesses.reduce((a, b) => a + b) == totalWins);

  final int gamesPlayed;
  final int totalWins;
  final int currentStreak;
  final int maxStreak;
  final List<int> gamesByGuesses;

  UserStats addGame(bool won, int guesses) {
    assert(guesses < 7);
    List<int> newGuesses = won
        ? (gamesByGuesses..[guesses - 1] = gamesByGuesses[guesses - 1] + 1)
        : gamesByGuesses;

    int newStreak = won ? currentStreak + 1 : 0;

    return UserStats(
      gamesPlayed: this.gamesPlayed + 1,
      totalWins: won ? this.totalWins + 1 : this.totalWins,
      currentStreak: newStreak,
      maxStreak: max(this.maxStreak, newStreak),
      gamesByGuesses: newGuesses,
    );
  }

  int get winPercentage => totalWins * 100 ~/ gamesPlayed;
  int get totalLost => gamesPlayed - totalWins;
  int get mostGuesses => max(totalLost, gamesByGuesses.reduce(max));
}
