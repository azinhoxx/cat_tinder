import 'package:flutter/material.dart';

abstract class SwiperNavigationButton extends StatelessWidget {
  final VoidCallback onPressed;

  static void _defaultCallback() {}

  const SwiperNavigationButton({super.key, this.onPressed = _defaultCallback});
}
