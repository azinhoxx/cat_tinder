import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

abstract final class AppUtils {
  AppUtils._();

  // Check if it's a Web platform first to avoid errors.
  // "dart:io" is not available on the Web.
  static final bool isSplashSupportedPlatform =
      kIsWeb || Platform.isIOS || Platform.isAndroid;

  static T? safeCast<T>(dynamic value) {
    return (value is T) ? value : null;
  }

  static Route<dynamic> buildRoute({
    required Widget page,
    bool animated = false,
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
    bool result = await InternetConnection().hasInternetAccess;
    return result;
  }
}
