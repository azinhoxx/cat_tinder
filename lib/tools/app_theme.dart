import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static final _defaultFontFamily = 'Montserrat';
  static final double _iconSize = 36;

  static ThemeData theme({required bool dark}) {
    final brightness = dark ? Brightness.dark : Brightness.light;

    final primaryBackgroundColor =
        dark
            ? AppColors.primaryBackgroundColorDark
            : AppColors.primaryBackgroundColorLight;

    final theme = ThemeData(
      brightness: brightness,
      fontFamily: GoogleFonts.getFont(_defaultFontFamily).fontFamily,
      primaryColor: primaryBackgroundColor,
      scaffoldBackgroundColor: primaryBackgroundColor,
      appBarTheme: AppBarTheme(backgroundColor: primaryBackgroundColor),
    );

    return theme.copyWith(iconTheme: theme.iconTheme.copyWith(size: _iconSize));
  }
}
