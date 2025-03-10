import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static final _defaultFontFamily = 'Montserrat';
  static final double _iconSize = 40;

  static ThemeData theme(bool isDark) {
    final brightness = isDark ? Brightness.dark : Brightness.light;
    final theme = ThemeData(
      brightness: brightness,
      fontFamily: GoogleFonts.getFont(_defaultFontFamily).fontFamily,
      scaffoldBackgroundColor: Colors.white,
    );
    return theme.copyWith(iconTheme: theme.iconTheme.copyWith(size: _iconSize));
  }
}
