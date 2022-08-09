import 'dart:math';

import 'package:equatable/equatable.dart';

class UserStats extends Equatable {
  UserStats({
    required this.userId,
    required this.gamesPlayed,
    required this.totalWins,
    required this.currentStreak,
    required this.maxStreak,
    required this.gamesByGuesses,
  })  : assert(gamesByGuesses.length == 6),
        assert(gamesByGuesses.reduce((a, b) => a + b) == totalWins);

  final String userId;
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
      userId: this.userId,
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

  @override
  List<Object?> get props => [userId];

  UserStats.fromJson(Map<String, dynamic> map)
      : userId = map['userId'],
        gamesPlayed = map['gamesPlayed'],
        totalWins = map['totalWins'],
        currentStreak = map['currentStreak'],
        maxStreak = map['maxStreak'],
        gamesByGuesses = map['gamesByGuesses'];

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'gamesPlayed': gamesPlayed,
      'totalWins': totalWins,
      'currentStreak': currentStreak,
      'maxStreak': maxStreak,
      'gamesByGuesses': gamesByGuesses,
    };
  }
}
