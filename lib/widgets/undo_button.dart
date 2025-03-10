import 'package:flutter/material.dart';

class UndoButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const UndoButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: Colors.blue,
      icon: Icon(Icons.rotate_left),
    );
  }
}
