import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hw_1/models/cat_model.dart';
import 'package:flutter_hw_1/models/error_model.dart';
import 'package:flutter_hw_1/utilities/error_handler.dart';
import 'package:flutter_hw_1/utilities/utils.dart';
import 'package:flutter_hw_1/widgets/home_screen/slide.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SwiperProvider extends ChangeNotifier {
  final ErrorHandler _errorHandler = ErrorHandler();

  final Future<SharedPreferencesWithCache> _prefs =
      SharedPreferencesWithCache.create(
        cacheOptions: const SharedPreferencesWithCacheOptions(
          allowList: <String>{'counter'},
        ),
      );

  final CardSwiperController controller = CardSwiperController();
  final List<Slide> _slides = [];

  bool _isFirstLoading = true;
  bool _isLoading = true;
  int _likesCount = 0;
  int _currentIndex = 0;

  List<Slide> get slides => _slides;
  int get likesCount => _likesCount;
  int get currentIndex => _currentIndex;
  bool get isLoading => _isLoading;
  bool get isFirstLoading => _isFirstLoading;
  CustomError? get error => _errorHandler.error;
  bool get isNotNextSlide => _currentIndex == slides.length;
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

  Future<void> _syncData() async {
    final SharedPreferencesWithCache prefs = await _prefs;
    _likesCount = prefs.getInt('counter') ?? 0;
    notifyListeners();
  }

  Future<void> _saveCounter() async {
    final SharedPreferencesWithCache prefs = await _prefs;
    await prefs.setInt('counter', _likesCount);
  }

  Future<bool> onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) async {
    _updateCounter(direction: direction);
    if (currentIndex != null) _currentIndex = currentIndex;
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
    _currentIndex = currentIndex;
    notifyListeners();
    return true;
  }

  Future<void> onEnd() async {
    if (!await _setNetworkError()) {
      _writeGenericError();
    }
    controller.undo();
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
  /// After [force=true] it will start from the first slide.
  Future<void> recoverFromError({bool force = false}) async {
    if (!await AppUtils.hasNetwork()) return;
    if (force) {
      _isLoading = true;
      _currentIndex = 0;
    }
    _errorHandler.error = null;
    notifyListeners();
    await _fetchCats(isNetwork: true);
  }

  Future<bool> _setNetworkError() async {
    bool online = await AppUtils.hasNetwork();
    if (!online) {
      _writeNetworkError();
    }
    return !online;
  }

  void _writeGenericError() {
    _errorHandler.setError(
      type: CustomErrorType.genericError,
      count: _slides.length,
    );
  }

  void _writeNetworkError() {
    _errorHandler.setError(
      type: CustomErrorType.networkError,
      count: _slides.length,
    );
  }

  Future<void> _fetchCats({bool isNetwork = false}) async {
    try {
      if (!isNetwork && !await AppUtils.hasNetwork()) return;
      final response = await http.get(Uri.parse(dotenv.env['CATS_API']!));
      if (response.statusCode == 200) {
        final cats = _parseCats(response.body);
        _slides.addAll(cats);
      } else {
        _writeGenericError();
      }
    } catch (_) {
      _writeGenericError();
    } finally {
      _finalizeFetching();
    }
  }

  void _finalizeFetching() {
    if (_isLoading) _isLoading = false;
    if (_isFirstLoading) {
      _isFirstLoading = false;
      if (AppUtils.isSplashSupportedPlatform) {
        FlutterNativeSplash.remove();
      }
    }
    if (_slides.isEmpty) {
      _writeNetworkError();
    }
    notifyListeners();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
