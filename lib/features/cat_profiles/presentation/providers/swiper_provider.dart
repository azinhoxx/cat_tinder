// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:cat_tinder/data/models/cat_model.dart';
// import 'package:cat_tinder/utilities/utils.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/slide.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:http/http.dart' as http;

class SwiperProvider extends ChangeNotifier {
  final CardSwiperController controller = CardSwiperController();

  final List<Slide> _slides = [];

  // bool _isFirstLoading = true;
  // bool _isLoading = true;

  int _likesCount = 0;
  int _currentIndex = 0;
  // bool _isHandling = false;

  List<Slide> get slides => _slides;
  // bool get isFirstLoading => _isFirstLoading;
  // bool get isLoading => _isLoading;
  int get likesCount => _likesCount;
  // bool get isHandling => _isHandling;
  bool get isNotNextSlide => _currentIndex == slides.length;
  bool get isNotPrevSlide => _currentIndex == 0;

  SwiperProvider() {
    // _fetchCats();
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
      // _fetchCats();
    }
  }

  Future<void> _updateCounter({
    required CardSwiperDirection direction,
    bool isUndo = false,
  }) async {
    final delta = isUndo ? -1 : 1;
    if (direction == CardSwiperDirection.right) _likesCount += delta;
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

  void onEnd() {
    controller.undo();
  }

  // List<Slide> _parseCats(String responseBody) {
  //   final data = jsonDecode(responseBody);
  //   if (data is List) {
  //     return data
  //         .map(
  //           (el) =>
  //               Slide(cat: CatModel.fromJson(json: el as Map<String, dynamic>)),
  //         )
  //         .toList();
  //   }
  //   return [];
  // }

  // Future<bool> handleError({bool force = false}) async {
  //   if (!_isHandling) {
  //     _isHandling = true;
  //     notifyListeners();
  //     if (!await AppUtils.hasNetwork()) {
  //       _isHandling = false;
  //       notifyListeners();
  //       return false;
  //     }
  //     if (force) {
  //       _isLoading = true;
  //       _currentIndex = 0;
  //     }
  //     notifyListeners();
  //     await _fetchCats(
  //       isNetwork: true,
  //       beforeNotify: () => {_isHandling = false},
  //     );
  //     return true;
  //   }
  //   return false;
  // }

  // Future<void> _fetchCats({
  //   bool isNetwork = false,
  //   VoidCallback? beforeNotify,
  // }) async {
  //   try {
  //     if (!isNetwork && !await AppUtils.hasNetwork()) return;
  //     final response = await http.get(Uri.parse(dotenv.env['CATS_API']!));
  //     if (response.statusCode == 200) {
  //       final cats = _parseCats(response.body);
  //       _slides.addAll(cats);
  //     }
  //   } catch (_) {
  //   } finally {
  //     _finalizeFetch(beforeNotify);
  //   }
  // }

  // void _finalizeFetch(VoidCallback? beforeNotify) {
  //   if (_isLoading) _isLoading = false;
  //   if (_isFirstLoading) {
  //     _isFirstLoading = false;
  //     if (AppUtils.isSplashSupportedPlatform) {
  //       FlutterNativeSplash.remove();
  //     }
  //   }
  //   if (beforeNotify != null) {
  //     beforeNotify();
  //   }
  //   notifyListeners();
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
