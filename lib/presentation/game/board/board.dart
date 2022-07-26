import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:wordddle/domain/models/word_guess.dart';
import 'package:wordddle/presentation/game/board/widgets/word_row.dart';

class Board extends StatelessWidget {
  const Board({
    required this.triedWords,
    required this.currentWord,
    Key? key,
  }) : super(key: key);

  final List<WordGuess> triedWords;
  final String currentWord;

  @override
  Widget build(BuildContext context) {
    log('change');
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [..._getWordRows(triedWords, currentWord)],
      ),
    );
  }

  List<WordRow> _getWordRows(List<WordGuess> triedWords, String currentWord) {
    List<WordRow> rows = [];
    for (int i = 0; i < 5; i++) {
      rows.add(
        WordRow(
          word: i == triedWords.length
              ? WordGuess.unchecked(currentWord)
              : i < triedWords.length
                  ? triedWords[i]
                  : WordGuess.unchecked(''),
        ),
      );
    }
    return rows;
  }
}
