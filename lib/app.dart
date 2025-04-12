import 'package:flutter/material.dart';
import 'package:cat_tinder/features/cat_profiles/data/models/cat_model.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/providers/cat_model_provider.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/screens/details_screen.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/screens/fullscreen_image.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/screens/home_screen.dart';
import 'package:cat_tinder/features/cat_profiles/utils/utils.dart';
import 'package:cat_tinder/theme.dart';

class CatTinderApp extends StatelessWidget {
  const CatTinderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CatTinder',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: AppTheme.theme(),
      onGenerateRoute: _onGenerateRoute,
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  final args = AppUtils.safeCast<Map<String, dynamic>>(settings.arguments);
  switch (settings.name) {
    case '/fullscreen':
    case '/details':
      final screen =
          settings.name == '/fullscreen'
              ? const FullscreenImage()
              : const DetailsScreen();
      return AppUtils.buildRoute(
        page: CatModelProvider(cat: args!['cat'] as CatModel, child: screen),
        animated: settings.name == '/details',
      );
    case '/':
    default:
      return AppUtils.buildRoute(page: const HomeScreen());
  }
}
