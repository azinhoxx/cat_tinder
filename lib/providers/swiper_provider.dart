import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hw_1/models/cat_model.dart';
import 'package:flutter_hw_1/widgets/home_screen/slide.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

enum ErrorType {
  networkError('No network connection'),
  genericError('Something went wrong');

  final String message;
  const ErrorType(this.message);
}

@immutable
class ErrorMessage {
  final ErrorType type;
  final int slidesCount;

  const ErrorMessage({required this.type, this.slidesCount = 0});
}

class SwiperProvider extends ChangeNotifier {
  final Future<SharedPreferencesWithCache> _prefs =
      SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions(
          allowList: <String>{'counter'},
        ),
      );

  final CardSwiperController controller = CardSwiperController();
  final List<Slide> _slides = [];

  ErrorMessage? _errorMessage;
  bool _isLoading = true;
  int _likesCount = 0;
  int _currentIndex = 0;

  List<Slide> get slides => _slides;
  int get likesCount => _likesCount;
  int get currentIndex => _currentIndex;
  bool get isLoading => _isLoading;
  ErrorMessage? get errorMessage => _errorMessage;

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
  /// It will set [errorMessage] to null.
  /// Set [force] flag for forced reload widget tree.
  Future<void> recoverFromError({bool force = false}) async {
    if (force) {
      _isLoading = true;
      _currentIndex = 0;
    }
    _errorMessage = null;
    notifyListeners();
    await _fetchCats();
  }

  static Future<bool> hasNetwork() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  void _setError(ErrorType type) {
    _errorMessage ??= ErrorMessage(type: type, slidesCount: _slides.length);
  }

  Future<bool> setNetworkError() async {
    bool online = await hasNetwork();
    if (!online) {
      _setError(ErrorType.networkError);
    }
    return online;
  }

  Future<void> _fetchCats() async {
    try {
      if (!await setNetworkError()) return;
      final response = await http.get(Uri.parse(dotenv.env['CATS_API']!));
      if (response.statusCode == 200) {
        final cats = _parseCats(response.body);
        _slides.addAll(cats);
      } else {
        _setError(ErrorType.genericError);
      }
    } catch (_) {
      _setError(ErrorType.genericError);
    } finally {
      if (isLoading) _isLoading = false;
      if (slides.isEmpty) {
        _setError(ErrorType.networkError);
      }
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
