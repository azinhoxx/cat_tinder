import 'package:flutter/material.dart';
import 'package:flutter_hw_1/screens/home_screen.dart';
import 'package:flutter_hw_1/theme.dart';

class CatTinderApp extends StatelessWidget {
  const CatTinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CatTinder',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: AppTheme.theme(),
    );
  }
}
