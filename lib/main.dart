import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hw_1/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;
import 'package:flutter_hw_1/constants/colors.dart';
import 'package:flutter_hw_1/providers/swiper_provider.dart';
import 'package:flutter_hw_1/utilities/utils.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  await dotenv.load();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: AppColors.primaryBackgroundColorLight,
      statusBarColor: AppColors.primaryBackgroundColorLight,
    ),
  );

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  if (AppUtils.isSplashSupportedPlatform) {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }

  runApp(
    ChangeNotifierProvider(
      create: (context) => SwiperProvider(),
      child: const CatTinderApp(),
    ),
  );
}
