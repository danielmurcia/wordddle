import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wordddle/data/game/game_api.dart';
import 'package:wordddle/data/game/game_repo_impl.dart';
import 'package:wordddle/domain/game/bloc/game_cubit.dart';
import 'package:wordddle/presentation/common/dimens.dart';
import 'package:wordddle/presentation/game/board/board.dart';
import 'package:wordddle/presentation/game/keyboard/keyboard.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GameCubit>(
      create: (_) => GameCubit(
        // TODO inject dependencies
        GameRepositoryImpl(
          GameApiImpl(),
        ),
      )..setupGame(),
      child: _GameScreen(),
    );
  }
}

class _GameScreen extends StatelessWidget {
  const _GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Wordddle!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppDimens.screenPadding),
        child: BlocBuilder<GameCubit, GameState>(
          builder: (_, GameState state) {
            switch (state.runtimeType) {
              case GameWon:
                _showSnackBar(context, 'You won :)');
                break;
              case GameOver:
                _showSnackBar(context, 'You lost :(');
                break;
              case NonExistentWord:
                _showSnackBar(context, 'Word doesn\'t exists');
                break;
            }
            return Column(
              children: [
                Expanded(
                  flex: 2,
                  child: Board(
                    triedWords: state.tries,
                    currentWord: state.currentWord,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Keyboard(
                    width: width - (AppDimens.screenPadding * 2),
                    incorrectLetters: state.incorrectLetters,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Future<void> _showSnackBar(BuildContext context, String label) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(label),
      ),
    );
  }
}
