import 'package:flutter/material.dart';
import 'package:flutter_hw_1/widgets/swiper_navigation_button.dart';

class UndoButton extends SwiperNavigationButton {
  const UndoButton({super.key, super.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.white,
      child: Icon(Icons.rotate_left_sharp, color: Colors.blueAccent),
    );
  }
}
