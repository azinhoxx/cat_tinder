import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hw_1/widgets/cat_app_bar.dart';
import 'package:flutter_hw_1/widgets/cat_scaffold.dart';
import 'package:flutter_hw_1/widgets/paw_loading_indicator.dart';
import 'package:flutter_hw_1/widgets/dislike_button.dart';
import 'package:flutter_hw_1/widgets/like_button.dart';
import 'package:flutter_hw_1/widgets/cat_swiper_provider.dart';
import 'package:flutter_hw_1/widgets/undo_button.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CatSwiperProvider(),
      child: CatScaffold(
        appBar: const CatAppBar(title: 'CatTinder'),
        body: Selector<CatSwiperProvider, bool>(
          selector: (context, provider) => provider.isLoading,
          builder:
              (context, isLoading, child) =>
                  isLoading
                      ? const PawLoadingIndicator()
                      : Column(
                        children: <Widget>[
                          Expanded(
                            child: Consumer<CatSwiperProvider>(
                              builder:
                                  (context, provider, child) => CardSwiper(
                                    controller: provider.controller,
                                    cardsCount: provider.slides.length,
                                    numberOfCardsDisplayed: min(
                                      3,
                                      provider.slides.length,
                                    ),
                                    backCardOffset: const Offset(0, 0),
                                    padding: const EdgeInsets.all(0),
                                    onSwipe: provider.onSwipe,
                                    onUndo: provider.onUndo,
                                    maxAngle: 15,
                                    allowedSwipeDirection:
                                        const AllowedSwipeDirection.only(
                                          right: true,
                                          left: true,
                                        ),
                                    cardBuilder:
                                        (
                                          context,
                                          index,
                                          horizontalOffsetPercentage,
                                          verticalOffsetPercentage,
                                        ) => provider.slides[index],
                                  ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 16),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 12,
                              children: <Widget>[
                                DislikeButton(),
                                LikeButton(),
                                UndoButton(),
                              ],
                            ),
                          ),
                        ],
                      ),
        ),
      ),
    );
  }
}
