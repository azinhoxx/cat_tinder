import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/icons.dart';

class DislikeButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const DislikeButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: Colors.red,
      icon: Icon(AppIcons.dislike),
    );
  }
}
