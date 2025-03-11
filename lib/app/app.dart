import 'package:flutter/material.dart';
import 'package:flutter_hw_1/screens/home_screen.dart';
import 'package:flutter_hw_1/theme/app_theme.dart';

class CatTinderApp extends StatelessWidget {
  const CatTinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      theme: AppTheme.theme(dark: false),
    );
  }
}
