import 'package:flutter/material.dart';
import 'package:wordddle/presentation/game/keyboard/widgets/key_row.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({
    required this.width,
    required this.incorrectLetters,
    Key? key,
  }) : super(key: key);

  final double width;
  final Set<String> incorrectLetters;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          KeyRow(
            width: width,
            values: ['q', 'w', 'e', 'r', 't', 'y', 'u', 'i', 'o', 'p'],
            incorrectLetters: incorrectLetters,
          ),
          KeyRow(
            width: width,
            values: ['a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l'],
            incorrectLetters: incorrectLetters,
          ),
          KeyRow(
            width: width,
            values: ['>', 'z', 'x', 'c', 'v', 'b', 'n', 'm', '<'],
            incorrectLetters: incorrectLetters,
          ),
        ],
      ),
    );
  }
}
