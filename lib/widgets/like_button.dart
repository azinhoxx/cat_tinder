import 'package:flutter/material.dart';
import 'package:flutter_hw_1/widgets/swiper_navigation_button.dart';

class LikeButton extends SwiperNavigationButton {
  const LikeButton({super.key, super.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.white,
      child: Icon(Icons.favorite_sharp, color: Colors.greenAccent),
    );
  }
}
