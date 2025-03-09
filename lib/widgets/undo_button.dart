import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw_1/base/swiper_navigation_button.dart';

class UndoButton extends SwiperNavigationButton {
  const UndoButton({super.key, super.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.white,
      child: Icon(CupertinoIcons.return_icon, color: Colors.blue),
    );
  }
}
