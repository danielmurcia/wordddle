import 'package:flutter/material.dart';
import 'package:wordddle/presentation/common/colors.dart';
import 'package:wordddle/presentation/common/fonts.dart';

ThemeData appTheme() {
  return ThemeData(
    fontFamily: "SourceSansPro",
    brightness: Brightness.dark,
    canvasColor: AppColors.darkGrey,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: AppColors.secondary,
      onSecondary: AppColors.darkGrey,
      error: Colors.redAccent,
      surface: AppColors.primary,
      onSurface: AppColors.white,
      onError: AppColors.lightGrey,
      background: AppColors.darkGrey,
      onBackground: AppColors.lightGrey,
    ),
    textTheme: TextTheme(
      headline1: AppFonts.headline,
      bodyText1: AppFonts.bodyText1,
      bodyText2: AppFonts.bodyText2,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColors.secondary,
    ),
    appBarTheme: AppBarTheme(
      centerTitle: true,
    ),
  );
}
