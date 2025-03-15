import 'package:flutter/material.dart';
import 'package:flutter_hw_1/screens/home_screen.dart';
import 'package:flutter_hw_1/theme.dart';
import 'package:flutter/services.dart';

class CatTinderApp extends StatelessWidget {
  const CatTinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'CatTinder',
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      theme: AppTheme.theme(),
    );
  }
}
