import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hw_1/widgets/home_app_bar.dart';
import 'package:flutter_hw_1/widgets/swiper_slide.dart';
import 'package:flutter_hw_1/widgets/blinking_paw.dart';
import 'package:flutter_hw_1/widgets/undo_button.dart';
import 'package:flutter_hw_1/widgets/dislike_button.dart';
import 'package:flutter_hw_1/widgets/like_button.dart';
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

  @override
  Widget build(BuildContext context) {
    final swiperPuddings =
        MediaQuery.of(context).size.width < 640
            ? const EdgeInsets.all(8)
            : const EdgeInsets.all(16);

    return Scaffold(
      appBar: const HomeAppBar(title: 'CatTinder'),
      body: SafeArea(
        child: Center(
          child: Container(
            margin: const EdgeInsets.fromLTRB(0, 8, 0, 40),
            child:
                _isLoading
                    ? BlinkingPaw()
                    : Column(
                      children: [
                        Expanded(
                          child: CardSwiper(
                            controller: _controller,
                            cardsCount: _slides.length,
                            numberOfCardsDisplayed: min(3, _slides.length),
                            backCardOffset: Offset(0, 0),
                            padding: swiperPuddings,
                            cardBuilder:
                                (
                                  context,
                                  index,
                                  horizontalThresholdPercentage,
                                  verticalThresholdPercentage,
                                ) => _slides[index],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            spacing: 15,
                            children: [
                              DislikeButton(onPressed: _onDislike),
                              LikeButton(onPressed: _onLike),
                              UndoButton(onPressed: _onUndo),
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

  void _cardBuilder() {}

  void _onLike() {
    _controller.swipe(CardSwiperDirection.right);
  }

  void _onDislike() {
    _controller.swipe(CardSwiperDirection.left);
  }

  void _onUndo() {
    _controller.undo();
  }

  Future<void> _fetchCats() async {
    final response = await http.get(Uri.parse(dotenv.env['CATS_API']!));

    try {
      switch (response.statusCode) {
        case 200:
          final data = jsonDecode(response.body);
          if (data is List) {
            final newSlides =
                data.map((el) {
                  return SwiperSlide(data: el as Map<String, dynamic>);
                }).toList();

            setState(() {
              _slides.addAll(newSlides);
              _isLoading = false;
            });
          }
      }
    } catch (error) {
      setState(() {
        _isLoading = false;
      });
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
