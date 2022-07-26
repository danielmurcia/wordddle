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
          ],
        ),
      ),
    );
  }
}
