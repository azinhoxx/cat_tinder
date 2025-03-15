import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hw_1/models/cat_model.dart';
import 'package:flutter_hw_1/widgets/home_screen/slide.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SwiperProvider extends ChangeNotifier {
  final Future<SharedPreferencesWithCache> _prefs =
      SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions(
          allowList: <String>{'counter'},
        ),
      );

  final CardSwiperController controller = CardSwiperController();
  final List<Slide> _slides = [];

  String? _errorMessage;
  bool _isLoading = true;
  int _likesCount = 0;
  int _currentIndex = 0;

  List<Slide> get slides => _slides;
  int get likesCount => _likesCount;
  int get currentIndex => _currentIndex;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  bool get isNotNextSlide => _currentIndex == slides.length - 1;
  bool get isNotPrevSlide => _currentIndex == 0;

  SwiperProvider() {
    _fetchCats();
    _syncData();
  }

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
    if (currentIndex != null && (_slides.length - currentIndex) <= 5) {
      _fetchCats();
    }
  }

  Future<void> _updateCounter({
    required CardSwiperDirection direction,
    bool isUndo = false,
  }) async {
    final delta = isUndo ? -1 : 1;
    if (direction == CardSwiperDirection.right) _likesCount += delta;
    await _saveCounter();
  }

  bool onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    _updateSlides(currentIndex);
    _updateCounter(direction: direction);
    if (currentIndex != null) _currentIndex = currentIndex;
    notifyListeners();
    return true;
  }

  bool onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    _updateCounter(direction: direction, isUndo: true);
    _currentIndex = currentIndex;
    notifyListeners();
    return true;
  }

  List<Slide> _parseCats(String responseBody) {
    final data = jsonDecode(responseBody);
    if (data is List) {
      return data
          .map(
            (el) =>
                Slide(cat: CatModel.fromJson(json: el as Map<String, dynamic>)),
          )
          .toList();
    }
    return [];
  }

  /// Use it when you need to have the opportunity to try again.
  /// For example, if there was an error the first time around.
  /// It will clear all slides previous to the trigger slide.
  Future<void> recoverFromError() async {
    _isLoading = true;
    _errorMessage = null;
    if (_currentIndex != 0) {
      _slides.removeRange(0, _currentIndex - 1);
    }
    _currentIndex = 0;
    notifyListeners();
    if (_slides.length <= 5) {
      await _fetchCats();
    }
  }

  Future<bool> _hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  void _handleError() {
    _errorMessage ??= 'Something went wrong';
  }

  Future<void> checkNetworkError() async {
    bool online = await _hasNetwork();
    if (!online) {
      _errorMessage = 'No internet connection';
    }
  }

  Future<void> _fetchCats() async {
    try {
      checkNetworkError();
      if (_errorMessage != null) return;
      final response = await http.get(Uri.parse(dotenv.env['CATS_API']!));
      if (response.statusCode == 200) {
        final cats = _parseCats(response.body);
        _slides.addAll(cats);
      } else {
        _handleError();
      }
    } catch (error) {
      _handleError();
    } finally {
      if (isLoading) _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _syncData() async {
    final SharedPreferencesWithCache prefs = await _prefs;
    _likesCount = prefs.getInt('counter') ?? 0;
    notifyListeners();
  }

  Future<void> _saveCounter() async {
    final SharedPreferencesWithCache prefs = await _prefs;
    await prefs.setInt('counter', _likesCount);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
