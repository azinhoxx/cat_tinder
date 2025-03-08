import 'package:flutter/material.dart';
import 'package:flutter_hw_1/screens/home_screen.dart';

class CatTinderApp extends StatelessWidget {
  const CatTinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Кототиндер',
      home: HomeScreen(),
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
    );
  }
}
