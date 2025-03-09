import 'package:flutter/material.dart';
import 'package:flutter_hw_1/screens/home_screen.dart';
import 'package:flutter_hw_1/theme/app_theme.dart';

class CatTinderApp extends StatefulWidget {
  const CatTinderApp({super.key});

  @override
  State<CatTinderApp> createState() => _CatTinderAppState();
}

class _CatTinderAppState extends State<CatTinderApp> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Кототиндер',
      home: HomeScreen(),
      theme: AppTheme.theme(isDark),
    );
  }
}
