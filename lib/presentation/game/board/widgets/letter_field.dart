import 'package:flutter/material.dart';
import 'package:wordddle/domain/models/letter_guess.dart';

class LetterField extends StatelessWidget {
  const LetterField({
    this.letter,
    Key? key,
  }) : super(key: key);

  final LetterGuess? letter;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: letter?.guess == GuessResponse.sink
            ? Colors.green
            : letter?.guess == GuessResponse.hit
                ? Colors.amberAccent
                : letter?.guess == GuessResponse.notFound
                    ? Colors.blueGrey
                    : Colors.grey,
        height: 40,
        width: 35,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            letter?.letter ?? '',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
