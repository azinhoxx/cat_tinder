import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DislikeButton extends StatelessWidget {
  final VoidCallback onPressed;

  static void _defaultCallback() {}

  const DislikeButton({super.key, this.onPressed = _defaultCallback});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: Colors.redAccent,
      icon: Icon(CupertinoIcons.xmark),
      iconSize: 32,
    );
  }
}
