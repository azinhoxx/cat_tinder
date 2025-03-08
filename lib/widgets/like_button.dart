import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  final VoidCallback onPressed;

  static void _defaultCallback() {}

  const LikeButton({super.key, this.onPressed = _defaultCallback});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: Colors.green,
      icon: Icon(CupertinoIcons.suit_heart_fill),
      iconSize: 32,
    );
  }
}
