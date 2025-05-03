import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit/home_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit/home_state.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_cubit.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class SwiperCardList extends StatelessWidget {
  const SwiperCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<HomeCubit, HomeState, int>(
      selector: (state) => state.totalSlides,
      builder: (context, count) {
        final cubit = context.read<HomeCubit>();
        return CardSwiper(
          controller: cubit.swiperService.controller,
          cardsCount: count,
          numberOfCardsDisplayed: count < 3 ? count : 3,
          backCardOffset: const Offset(0, 0),
          padding: const EdgeInsets.all(0),
          onSwipe:
              (previousIndex, currentIndex, direction) => _onSwipe(
                currentIndex,
                direction,
                context,
                cubit.state.slides[previousIndex],
              ),
          onUndo:
              (previousIndex, currentIndex, direction) => _onUndo(
                currentIndex,
                direction,
                context,
                cubit.state.slides[currentIndex],
              ),
          isLoop: false,
          maxAngle: 15,
          allowedSwipeDirection: const AllowedSwipeDirection.only(
            right: true,
            left: true,
          ),
          cardBuilder:
              (
                context,
                index,
                horizontalOffsetPercentage,
                verticalOffsetPercentage,
              ) => Slide(cat: cubit.state.slides[index]),
        );
      },
    );
  }

  bool _onSwipe(
    int? currentIndex,
    CardSwiperDirection direction,
    BuildContext context,
    CatEntity cat,
  ) {
    final homeCubit = context.read<HomeCubit>();

    if (homeCubit.state.currentIndex + 1 >= homeCubit.state.totalSlides) {
      return false;
    }

    if (direction == CardSwiperDirection.right) {
      context.read<LikedCatsCubit>().addCat(cat);
    }

    homeCubit.updateIndex(currentIndex);
    homeCubit.updateSlides();

    return true;
  }

  bool _onUndo(
    int currentIndex,
    CardSwiperDirection direction,
    BuildContext context,
    CatEntity cat,
  ) {
    if (direction == CardSwiperDirection.right) {
      context.read<LikedCatsCubit>().removeCat(cat);
    }

    context.read<HomeCubit>().updateIndex(currentIndex);

    return true;
  }
}
