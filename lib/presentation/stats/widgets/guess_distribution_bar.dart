import 'package:flutter/material.dart';

class GuessDistributionBar extends StatelessWidget {
  const GuessDistributionBar({
    required this.tries,
    required this.maxValue,
    this.value = 0,
    Key? key,
  })  : assert(value <= maxValue),
        super(key: key);

  final String tries;
  final int value;
  final int maxValue;

  @override
  Widget build(BuildContext context) {
    double barMaxWidth = (MediaQuery.of(context).size.width / 2);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 20,
            child: Text(tries),
          ),
          Container(
            width: value * barMaxWidth / maxValue,
            height: 20,
            color: tries == 'X'
                ? Theme.of(context).colorScheme.error
                : Theme.of(context).colorScheme.secondary,
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              value.toString(),
              textAlign: TextAlign.end,
            ),
          ),
        ],
      ),
    );
  }
}
