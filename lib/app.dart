import 'package:cat_tinder/core/routing/app_routing.dart';
import 'package:flutter/material.dart';
import 'package:cat_tinder/theme.dart';

class CatTinderApp extends StatelessWidget {
  const CatTinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CatTinder',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
      routerConfig: router,
    );
  }
}
