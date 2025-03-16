import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hw_1/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;
import 'package:flutter_hw_1/utilities/utils.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  await dotenv.load();
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
  );
  if (AppUtils.isSplashSupportedPlatform) {
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  }
  runApp(const CatTinderApp());
}
