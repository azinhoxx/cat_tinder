import 'package:flutter/material.dart';
import 'package:flutter_hw_1/models/cat_model.dart';
import 'package:flutter_hw_1/providers/cat_model_provider.dart';
import 'package:flutter_hw_1/screens/details_screen.dart';
import 'package:flutter_hw_1/screens/error_screen.dart';
import 'package:flutter_hw_1/screens/fullscreen_image.dart';
import 'package:flutter_hw_1/screens/home_screen.dart';
import 'package:flutter_hw_1/utilities/utils.dart';
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
      initialRoute: '/',
      theme: AppTheme.theme(),
      onGenerateRoute: _onGenerateRoute,
    );
  }
}

Route<dynamic> _onGenerateRoute(RouteSettings settings) {
  final args = AppUtils.safeCast<Map<String, dynamic>>(settings.arguments);
  switch (settings.name) {
    case '/error':
      return AppUtils.buildRoute(
        page: PopScope(
          canPop: false,
          child: ErrorScreen(
            message: args!['message'] as String,
            buttonText: args['buttonText'] as String,
            onPressed: args['onPressed'] as VoidCallback?,
          ),
        ),
      );
    case '/fullscreen':
    case '/details':
      final screen =
          settings.name == '/fullscreen'
              ? const FullscreenImage()
              : const DetailsScreen();
      return AppUtils.buildRoute(
        page: CatModelProvider(cat: args!['cat'] as CatModel, child: screen),
        customAnimation: settings.name == '/details',
      );
    case '/':
    default:
      return AppUtils.buildRoute(page: const HomeScreen());
  }
}
