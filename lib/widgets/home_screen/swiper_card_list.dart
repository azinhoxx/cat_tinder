import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_hw_1/providers/swiper_provider.dart';
import 'package:provider/provider.dart';

class SwiperCardList extends StatelessWidget {
  const SwiperCardList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SwiperProvider>(context, listen: false);

    return Selector<SwiperProvider, int>(
      selector: (context, provider) => provider.slides.length,
      builder: (context, count, child) {
        return CardSwiper(
          controller: provider.controller,
          cardsCount: count,
          numberOfCardsDisplayed: count < 3 ? count : 3,
          backCardOffset: const Offset(0, 0),
          padding: const EdgeInsets.all(0),
          onSwipe: provider.onSwipe,
          onUndo: provider.onUndo,
          onEnd: provider.onEnd,
          isLoop: false,
          maxAngle: 15,
          allowedSwipeDirection: const AllowedSwipeDirection.only(
            right: true,
            left: true,
          ),
          cardBuilder: (
            context,
            index,
            horizontalOffsetPercentage,
            verticalOffsetPercentage,
          ) {
            return provider.slides[index];
          },
        );
      },
    );
  }
}
