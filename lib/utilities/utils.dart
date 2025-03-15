import 'package:flutter/material.dart';

abstract final class AppUtils {
  AppUtils._();

  static T? safeCast<T>(dynamic value) {
    return (value is T) ? value : null;
  }

  static MaterialPageRoute<dynamic> buildRoute(Widget page) {
    return MaterialPageRoute(builder: (context) => page);
  }
}
