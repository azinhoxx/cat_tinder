import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:injectable/injectable.dart';

@module
abstract class SwiperModule {
  @lazySingleton
  CardSwiperController get swiperController => CardSwiperController();
}
