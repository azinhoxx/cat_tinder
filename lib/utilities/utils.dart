import 'dart:io';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract final class AppUtils {
  AppUtils._();

  static final bool isSplashSupportedPlatform =
      kIsWeb || Platform.isIOS || Platform.isAndroid;

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
      if (kIsWeb) {
        print('WEB');
        final response = await http.get(Uri.parse('https://example.com'));
        print(response);
        return response.statusCode == 200;
      } else {
        print('NOT WEB');
        final result = await InternetAddress.lookup('example.com');
        return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
      }
    } catch (_) {
      return false;
    }
  }
}
