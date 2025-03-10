import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const LikeButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: Colors.green,
      icon: Icon(Icons.favorite_sharp),
    );
  }
}
