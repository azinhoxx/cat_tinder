import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isFirstLoading,
    required bool isFetching,
    required List<CatEntity> slides,
    required int currentIndex,
    required int likesCount,
    String? errorMessage,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
    isFirstLoading: true,
    isFetching: false,
    slides: [],
    currentIndex: 0,
    likesCount: 0,
    errorMessage: null,
  );
}

extension HomeStateX on HomeState {
  int get totalSlides => slides.length;
  bool get isLastSlide => currentIndex >= totalSlides - 1;
  bool get isFirstSlide => currentIndex <= 0;
  bool get isEmpty => slides.isEmpty;
  bool get isNotEmpty => slides.isNotEmpty;
  bool get isNearEnd => totalSlides - currentIndex <= 3;
}
