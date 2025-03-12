import 'package:flutter/material.dart';
import 'package:flutter_hw_1/constants/icons.dart';

class UndoButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const UndoButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      color: Colors.blue,
      icon: Icon(AppIcons.undo),
    );
  }
}
