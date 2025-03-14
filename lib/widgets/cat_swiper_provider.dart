import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hw_1/models/cat_model.dart';
import 'package:flutter_hw_1/widgets/cat_slide.dart';
import 'package:http/http.dart' as http;

class CatSwiperProvider extends ChangeNotifier {
  final CardSwiperController controller = CardSwiperController();
  final List<CatSlide> _slides = [];
  String? _errorMessage;

  CatSwiperProvider() {
    _init();
  }

  Future<void> _init() async {
    await _fetchCats();
  }

  bool _isLoading = true;
  int _likesCount = 0;

  List<CatSlide> get slides => _slides;
  int get likesCount => _likesCount;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  void onLike() {
    controller.swipe(CardSwiperDirection.right);
  }

  void onDislike() {
    controller.swipe(CardSwiperDirection.left);
  }

  void onRevoke() {
    controller.undo();
  }

  void _updateSlides(int? currentIndex) {
    if (currentIndex != null &&
        (_slides.length - currentIndex) <= _slides.length ~/ 2) {
      _fetchCats();
    }
  }

  void _updateCounter({
    required CardSwiperDirection direction,
    bool isUndo = false,
  }) {
    final delta = isUndo ? -1 : 1;
    if (direction == CardSwiperDirection.right) _likesCount += delta;
  }

  bool onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    _updateCounter(direction: direction);
    _updateSlides(currentIndex);
    notifyListeners();
    return true;
  }

  bool onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    _updateCounter(direction: direction, isUndo: true);
    notifyListeners();
    return true;
  }

  List<CatSlide> _parseCats(String responseBody) {
    final data = jsonDecode(responseBody);
    if (data is List) {
      return data
          .map(
            (el) => CatSlide(
              cat: CatModel.fromJson(json: el as Map<String, dynamic>),
            ),
          )
          .toList();
    }
    return [];
  }

  Future<void> _fetchCats() async {
    try {
      final response = await http.get(Uri.parse(dotenv.env['CATS_API']!));
      if (response.statusCode == 200) {
        final cats = _parseCats(response.body);
        _slides.addAll(cats);
      } else {
        _errorMessage = 'Something went wrong';
      }
    } catch (error) {
      _errorMessage = 'Something went wrong';
    } finally {
      if (isLoading) _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
