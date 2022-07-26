import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordddle/domain/game/bloc/game_cubit.dart';
import 'package:wordddle/presentation/game/keyboard/widgets/key_letter.dart';

class KeyRow extends StatelessWidget {
  const KeyRow({
    required this.width,
    required this.values,
    required this.incorrectLetters,
    Key? key,
  }) : super(key: key);

  final double width;
  final List<String> values;
  final Set<String> incorrectLetters;

  @override
  Widget build(BuildContext context) {
    double letterWidth = width / values.length;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: values
            .map(
              (String char) => KeyLetter(
                char: char,
                height: 40,
                width: letterWidth,
                onPressed: () => context.read<GameCubit>().keyPressed(char),
                discarded: incorrectLetters.contains(char),
              ),
            )
            .toList(),
      ),
    );
  }
}
