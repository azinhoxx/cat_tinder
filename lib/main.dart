import 'package:cat_tinder/core/di/app_component/app_component.dart';
import 'package:cat_tinder/core/utils/constants/supported_splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cat_tinder/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cat_tinder/core/utils/constants/app_colors.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void customize() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.primaryBackgroundColorLight,
      statusBarColor: AppColors.primaryBackgroundColorLight,
    ),
  );

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  if (isSplashSupportedPlatform) {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }
}

Future<void> main() async {
  await dotenv.load();

  customize();

  WidgetsFlutterBinding.ensureInitialized();
  await initAppComponentLocator();

  runApp(const CatTinderApp());
}
