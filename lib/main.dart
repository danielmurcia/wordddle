import 'package:flutter/material.dart';
import 'package:wordddle/presentation/common/themes.dart';
import 'package:wordddle/presentation/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wordddle',
      theme: appTheme(),
      home: HomeScreen(),
    );
  }
}
