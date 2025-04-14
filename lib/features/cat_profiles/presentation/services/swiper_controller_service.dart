import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwiperControllerService {
  final CardSwiperController controller;

  const SwiperControllerService(this.controller);

  void swipeRight() {
    controller.swipe(CardSwiperDirection.right);
  }

  void swipeLeft() {
    controller.swipe(CardSwiperDirection.left);
  }

  void undo() {
    controller.undo();
  }
}
