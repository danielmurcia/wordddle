import 'package:flutter/material.dart';

//TODO move to constants
const double padding = 2.0;

class KeyLetter extends StatelessWidget {
  const KeyLetter({
    required this.char,
    required this.height,
    required this.width,
    required this.onPressed,
    required this.discarded,
    Key? key,
  }) : super(key: key);

  final String char;
  final double height;
  final double width;
  final VoidCallback onPressed;
  final bool discarded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding),
      child: SizedBox(
        height: height,
        width: width - (padding * 2),
        child: OutlinedButton(
          onPressed: onPressed,
          child: Text(
            char,
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            backgroundColor: char == '>'
                ? Colors.lightGreen
                : char == '<'
                    ? Colors.redAccent
                    : discarded
                        ? Colors.blue
                        : Colors.blueGrey,
          ),
        ),
      ),
    );
  }
}
