import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wordddle/domain/game/repo/game_repo.dart';
import 'package:wordddle/domain/models/failure.dart';
import 'package:wordddle/domain/models/word_guess.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit(this._repository) : super(GameLoading());

  GameRepository _repository;

  String word = '';
  List<WordGuess> tries = [];
  String currentTry = '';
  Set<String> incorrectLetters = Set();

  void setupGame() {
    word = _repository.getWordOfTheDay();
    log("WORD: $word");
    assert(word.length == 5);
  }

  void _checkWord() async {
    Either<Failure, bool> wordExists = await _repository.wordExists(currentTry);

    wordExists.fold((Failure f) => log(f.errorMessage), (bool exists) {
      if (exists) {
        tries.add(WordGuess.build(guess: currentTry, wordToGuess: word));
        incorrectLetters.addAll(tries.last.incorrectLetters);

        if (tries.last.winningWord) {
          emit(GameWon(tries, incorrectLetters));
          return;
        }

        if (tries.length < 5) {
          _reset();
          return;
        }

        emit(GameOver(tries, incorrectLetters));
      } else {
        emit(InexistentWord(tries, incorrectLetters));
      }
    });
  }

  void keyPressed(String char) {
    log('key pressed: $char');
    switch (char) {
      case '>':
        _checkWord();
        break;
      case '<':
        _removeChar();
        break;
      default:
        _addChar(char);
        break;
    }
  }

  void _addChar(String char) {
    if (currentTry.length < 5) {
      currentTry += char;
    }
    _emitNextTry();
  }

  void _removeChar() {
    currentTry = currentTry.substring(0, currentTry.length - 1);
    _emitNextTry();
  }

  void _reset() {
    currentTry = '';
    _emitNextTry();
  }

  void _emitNextTry() {
    log('word: $currentTry');
    emit(GameLoading());
    emit(GameNextTry(tries, currentTry, incorrectLetters));
  }
}
