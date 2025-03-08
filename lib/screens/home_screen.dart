import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw_1/widgets/app_bar.dart';
import 'package:flutter_hw_1/widgets/swiper_slide.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_hw_1/widgets/dislike_button.dart';
import 'package:flutter_hw_1/widgets/like_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CardSwiperController _controller = CardSwiperController();
  final List<SwiperSlide> _slides = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CatTinderAppBar(title: 'CatTinder'),
      body: SafeArea(
        child: Center(
          child:
              _slides.isEmpty
                  ? CircularProgressIndicator.adaptive()
                  : Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.8,
                        child: CardSwiper(
                          controller: _controller,
                          cardsCount: _slides.length,
                          numberOfCardsDisplayed: 1,
                          cardBuilder:
                              (
                                context,
                                index,
                                horizontalThresholdPercentage,
                                verticalThresholdPercentage,
                              ) => _slides[index],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 10,
                        children: [
                          DislikeButton(onPressed: () => {print('Dislike')}),
                          LikeButton(onPressed: () => {print('Like')}),
                        ],
                      ),
                    ],
                  ),
        ),
      ),
    );
  }

  Future<void> _fetchCats() async {
    final response = await http.get(Uri.parse(dotenv.env['CATS_API']!));

    try {
      switch (response.statusCode) {
        case 200:
          final data = jsonDecode(response.body);
          if (data is List) {
            final newSlides = data.map((el) {
              return SwiperSlide(data: el as Map<String, dynamic>);
            });

            setState(() {
              _slides.addAll(newSlides);
            });
          }
      }
    } catch (error) {}
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
