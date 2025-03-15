import 'dart:io';

import 'package:flutter/material.dart';

abstract final class AppUtils {
  AppUtils._();

  static T? safeCast<T>(dynamic value) {
    return (value is T) ? value : null;
  }

  static MaterialPageRoute<dynamic> buildRoute(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
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
