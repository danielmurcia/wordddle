import 'package:flutter/material.dart';
import 'package:wordddle/domain/models/word_guess.dart';

import 'letter_field.dart';

class WordRow extends StatelessWidget {
  const WordRow({
    required this.word,
    Key? key,
  }) : super(key: key);

  final WordGuess word;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _getLetterField(word),
      ),
    );
  }

  List<LetterField> _getLetterField(WordGuess word) {
    List<LetterField> letters = [];
    for (int i = 0; i < 5; i++) {
      letters.add(
        LetterField(
          letter: i < word.letters.length ? word.letters[i] : null,
        ),
      );
    }
    return letters;
  }
}
