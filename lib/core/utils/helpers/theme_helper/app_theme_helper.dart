import 'package:cat_tinder/core/utils/constants/app/app_decorations.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/core/utils/constants/app/app_colors.dart';

abstract final class AppTheme {
  AppTheme._();

  static const _defaultFontFamily = 'TinkoffSans';
  static const _defaultFontFamilyTitle = 'TinkoffSans';
  static const double _iconSize = 36;

  static ThemeData theme() {
    const primaryBackgroundColor = AppColors.primaryBackgroundColorLight;

    final theme = ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryBackgroundColor,
      fontFamily: _defaultFontFamily,
      scaffoldBackgroundColor: primaryBackgroundColor,
      appBarTheme: const AppBarTheme(
        scrolledUnderElevation: 0,
        backgroundColor: primaryBackgroundColor,
        iconTheme: IconThemeData(color: Colors.redAccent, size: 20),
        titleTextStyle: TextStyle(
          fontFamily: _defaultFontFamilyTitle,
          color: Colors.redAccent,
          fontSize: 42,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: const CardTheme(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppDecorations.defaultBorderRadius),
          ),
        ),
      ),
      iconTheme: IconThemeData.fallback().copyWith(size: _iconSize),
    );

    return theme;
  }
}
