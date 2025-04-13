import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;

abstract final class AppUtils {
  AppUtils._();

  // Check if it's a Web platform first to avoid errors.
  // "dart:io" is not available on the Web.
  static final bool isSplashSupportedPlatform =
      kIsWeb || Platform.isIOS || Platform.isAndroid;
}
