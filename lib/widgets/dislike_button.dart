import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw_1/base/swiper_navigation_button.dart';

class DislikeButton extends SwiperNavigationButton {
  const DislikeButton({super.key, super.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.white,
      child: Icon(CupertinoIcons.xmark, color: Colors.redAccent),
    );
  }
}
