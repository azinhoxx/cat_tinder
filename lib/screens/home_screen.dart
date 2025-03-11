import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hw_1/widgets/app_bar.dart';
import 'package:flutter_hw_1/constants/icons.dart';
import 'package:flutter_hw_1/widgets/swiper_navigation_button.dart';
import 'package:flutter_hw_1/widgets/swiper_slide.dart';
import 'package:flutter_hw_1/widgets/blinking_paw.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CardSwiperController _controller = CardSwiperController();
  final List<SwiperSlide> _slides = [];

  bool _isLoading = true;
  bool _isUndoVisible = false;

  int _likeCounter = 0;
  int _dislikeCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CatAppBar(title: 'CatTinder'),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 16).copyWith(bottom: 36),
            child:
                _isLoading
                    ? const BlinkingPaw()
                    : Column(
                      children: [
                        Expanded(
                          child: SizedBox(
                            width: 560,
                            child: CardSwiper(
                              controller: _controller,
                              cardsCount: _slides.length,
                              numberOfCardsDisplayed: min(3, _slides.length),
                              backCardOffset: const Offset(0, 0),
                              padding: const EdgeInsets.all(6),
                              onSwipe: _onSwipe,
                              onUndo: _onUndo,
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
                                  ) => _slides[index],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 20,
                            children: [
                              SwiperNavigationButton(
                                onPressed: _onDislike,
                                icon: AppIcons.dislike,
                                color: Colors.red,
                              ),
                              SwiperNavigationButton(
                                onPressed: _onLike,
                                icon: AppIcons.like,
                                color: Colors.green,
                              ),
                              SwiperNavigationButton(
                                onPressed: _isUndoVisible ? _onRevoke : null,
                                icon: AppIcons.undo,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
          ),
        ),
      ),
    );
  }

  void _onLike() {
    _controller.swipe(CardSwiperDirection.right);
  }

  void _onDislike() {
    _controller.swipe(CardSwiperDirection.left);
  }

  void _onRevoke() {
    _controller.undo();
  }

  void _updateUndoVisibility(int? currentIndex) {
    setState(() => _isUndoVisible = currentIndex != null && currentIndex != 0);
  }

  void _updateSlides(int? currentIndex) {
    if (currentIndex != null &&
        (_slides.length - currentIndex) <= _slides.length ~/ 2) {
      _fetchCats();
    }
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    setState(() {
      direction == CardSwiperDirection.right
          ? _likeCounter++
          : _dislikeCounter++;
    });
    _updateSlides(currentIndex);
    _updateUndoVisibility(currentIndex);
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    _updateUndoVisibility(currentIndex);
    return true;
  }

  List<SwiperSlide> _parseCats(String responseBody) {
    final data = jsonDecode(responseBody);
    if (data is List) {
      return data
          .map((el) => SwiperSlide(data: el as Map<String, dynamic>))
          .toList();
    }
    return [];
  }

  Future<void> _fetchCats() async {
    try {
      final response = await http.get(Uri.parse(dotenv.env['CATS_API']!));
      switch (response.statusCode) {
        case 200:
          setState(() {
            _slides.addAll(_parseCats(response.body));
            _isLoading = false;
          });
      }
    } catch (error) {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fetchCats();
  }
}
