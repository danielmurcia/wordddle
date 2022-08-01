import 'package:flutter/material.dart';

enum StatsMainItemType {
  played,
  winPercentage,
  currentStreak,
  maxStreak,
}

class StatsMainItem extends StatelessWidget {
  const StatsMainItem({
    required this.type,
    required this.value,
    Key? key,
  }) : super(key: key);

  final StatsMainItemType type;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          _getTypeValue(type),
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
        Text(
          value.toString(),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ],
    );
  }

  String _getTypeValue(StatsMainItemType type) {
    switch (type) {
      case StatsMainItemType.played:
        return 'Played';
      case StatsMainItemType.winPercentage:
        return 'Win %';
      case StatsMainItemType.currentStreak:
        return 'Current\nstreak';
      case StatsMainItemType.maxStreak:
        return 'Max\nstreak';
    }
  }
}
