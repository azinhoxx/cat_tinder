import 'package:flutter/material.dart';
import 'package:cat_tinder/core/utils/constants/app_colors.dart';

abstract final class AppTheme {
  AppTheme._();

  static const _defaultFontFamily = 'Montserrat';
  static const _defaultFontFamilyTitle = 'Sour Gummy';
  static const double _iconSize = 36;

  static ThemeData theme() {
    final primaryBackgroundColor = AppColors.primaryBackgroundColorLight;

    final theme = ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryBackgroundColor,
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontFamily: _defaultFontFamily,
          color: Colors.black,
        ),
      ),
      scaffoldBackgroundColor: primaryBackgroundColor,
      appBarTheme: AppBarTheme(
        scrolledUnderElevation: 0,
        backgroundColor: primaryBackgroundColor,
        iconTheme: IconThemeData(color: Colors.redAccent, size: 28),
        titleTextStyle: TextStyle(
          fontFamily: _defaultFontFamilyTitle,
          color: Colors.redAccent,
          fontSize: 42,
          letterSpacing: 1,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardTheme(color: primaryBackgroundColor),
    );

    return theme.copyWith(iconTheme: theme.iconTheme.copyWith(size: _iconSize));
  }
}
