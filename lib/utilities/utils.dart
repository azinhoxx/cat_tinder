import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

abstract final class AppUtils {
  AppUtils._();

  static final bool isSplashSupportedPlatform =
      Platform.isIOS || Platform.isAndroid || kIsWeb;

  static T? safeCast<T>(dynamic value) {
    return (value is T) ? value : null;
  }

  static Route<dynamic> buildRoute({
    required Widget page,
    bool animated = true,
  }) {
    if (animated) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const Offset begin = Offset(1.0, 0.0);
          const Offset end = Offset.zero;
          final CurveTween curveTween = CurveTween(curve: Curves.ease);
          final Animatable<Offset> tween = Tween(
            begin: begin,
            end: end,
          ).chain(curveTween);
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      );
    } else {
      return MaterialPageRoute(builder: (builder) => page);
    }
  }

  static Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }
}
