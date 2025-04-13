import 'package:cat_tinder/core/utils/helpers/theme_helper/app_theme_helper.dart';
import 'package:cat_tinder/core/utils/routing/app_routing.dart';
import 'package:flutter/material.dart';

class CatTinderApp extends StatelessWidget {
  const CatTinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CatTinder',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: AppTheme.theme(),
    );
  }
}
