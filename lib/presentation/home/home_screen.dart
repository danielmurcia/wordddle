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
      appBar: AppBar(
        title: Text('Wordddle!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.screenPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      context: context, builder: _iosStatsDialog(context))
                  : showDialog(
                      context: context, builder: _materialStatsDialog(context)),
              child: Text('Your stats'),
            ),
          ],
        ),
      ),
    );
  }

  WidgetBuilder _iosStatsDialog(BuildContext context) {
    return (context) => CupertinoAlertDialog(
          title: Text('Your stats'),
          actions: [
            CupertinoDialogAction(
              onPressed: () {},
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
              onPressed: () {},
              child: Text('Close'),
            ),
          ],
        );
  }
}
