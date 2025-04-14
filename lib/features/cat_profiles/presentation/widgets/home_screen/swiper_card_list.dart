import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_state.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwiperCardList extends StatelessWidget {
  const SwiperCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, int>(
      selector: (state) => state.slides.length,
      builder: (context, count) {
        final cubit = context.read<HomeCubit>();
        return CardSwiper(
          controller: cubit.swiperService.controller,
          cardsCount: count,
          numberOfCardsDisplayed: count < 3 ? count : 3,
          backCardOffset: const Offset(0, 0),
          padding: const EdgeInsets.all(0),
          onSwipe: cubit.onSwipe,
          onUndo: cubit.onUndo,
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
            return Slide(cat: cubit.state.slides[index]);
          },
        );
      },
    );
  }
}
