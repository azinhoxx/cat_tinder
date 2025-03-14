import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/colors.dart';

class AppTheme {
  AppTheme._();

  static const _defaultFontFamily = 'Montserrat';
  static const _defaultFontFamilyTitle = 'Sour Gummy';
  static const double _iconSize = 36;

  static ThemeData theme({required bool dark}) {
    final brightness = dark ? Brightness.dark : Brightness.light;

    final primaryBackgroundColor =
        dark
            ? AppColors.primaryBackgroundColorDark
            : AppColors.primaryBackgroundColorLight;

    final theme = ThemeData(
      brightness: brightness,
      primaryColor: primaryBackgroundColor,
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontFamily: _defaultFontFamily,
          color: dark ? Colors.white : Colors.black,
        ),
      ),
      scaffoldBackgroundColor: primaryBackgroundColor,
      appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0,
        backgroundColor: primaryBackgroundColor,
        titleTextStyle: TextStyle(
          fontFamily: _defaultFontFamilyTitle,
          color: Colors.redAccent,
          fontSize: 42,
          letterSpacing: 1,
        ),
      ),
      cardTheme: CardTheme(color: primaryBackgroundColor),
    );

    return theme.copyWith(iconTheme: theme.iconTheme.copyWith(size: _iconSize));
  }
}
