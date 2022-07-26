import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wordddle/presentation/common/dimens.dart';
import 'package:wordddle/presentation/game/game_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.screenPadding),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    'Wordddle!',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => GameScreen()),
                      ),
                      child: Text('Play today\'s game'),
                    ),
                    ElevatedButton(
                      onPressed: () => Platform.isIOS
                          ? showCupertinoDialog(
                              context: context,
                              builder: _iosStatsDialog(context))
                          : showDialog(
                              context: context,
                              builder: _materialStatsDialog(context)),
                      child: Text('Your stats'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  WidgetBuilder _iosStatsDialog(BuildContext context) {
    return (context) => CupertinoAlertDialog(
          title: Text('Your stats'),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context, 'CLOSE'),
              child: Text('Close'),
            ),
          ],
        );
  }

  WidgetBuilder _materialStatsDialog(BuildContext context) {
    return (context) => AlertDialog(
          title: Text('Your stats'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'CLOSE'),
              child: Text(
                'CLOSE',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ],
        );
  }
}
