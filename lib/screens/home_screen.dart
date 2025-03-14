import 'package:flutter/material.dart';
import 'package:flutter_hw_1/widgets/base/cat_app_bar.dart';
import 'package:flutter_hw_1/widgets/base/cat_scaffold.dart';
import 'package:flutter_hw_1/widgets/base/error_message.dart';
import 'package:flutter_hw_1/widgets/base/paw_loading_indicator.dart';
import 'package:flutter_hw_1/widgets/home_screen/dislike_button.dart';
import 'package:flutter_hw_1/widgets/home_screen/like_button.dart';
import 'package:flutter_hw_1/providers/swiper_provider.dart';
import 'package:flutter_hw_1/widgets/home_screen/undo_button.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CatScaffold(
      appBar: const CatAppBar(),
      body: ChangeNotifierProvider(
        create: (context) => SwiperProvider(),
        child: Selector<
          SwiperProvider,
          ({bool isLoading, String? errorMessage})
        >(
          selector:
              (context, provider) => (
                isLoading: provider.isLoading,
                errorMessage: provider.errorMessage,
              ),
          builder:
              (context, value, child) =>
                  value.errorMessage != null
                      ? ErrorMessage(
                        message: value.errorMessage!,
                        buttonText: 'TRY AGAIN',
                        onPressed:
                            Provider.of<SwiperProvider>(
                              context,
                              listen: false,
                            ).fetchMoreCats,
                      )
                      : value.isLoading
                      ? const PawLoadingIndicator()
                      : Column(
                        children: <Widget>[
                          Expanded(
                            child: Selector<SwiperProvider, int>(
                              selector:
                                  (context, provider) => provider.slides.length,
                              builder: (context, value, child) {
                                final provider = Provider.of<SwiperProvider>(
                                  context,
                                  listen: false,
                                );
                                return CardSwiper(
                                  controller: provider.controller,
                                  cardsCount: provider.slides.length,
                                  numberOfCardsDisplayed:
                                      provider.slides.length < 3
                                          ? provider.slides.length
                                          : 3,
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
                                );
                              },
                            ),
                          ),
                          if (child != null) child,
                        ],
                      ),
          child: Container(
            margin: const EdgeInsets.only(top: 16),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 12,
              children: <Widget>[DislikeButton(), LikeButton(), UndoButton()],
            ),
          ),
        ),
      ),
    );
  }
}
