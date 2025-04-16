import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default(true) bool isFirstLoading,
    @Default(false) bool isFetching,
    @Default(<CatEntity>[]) List<CatEntity> slides,
    @Default(0) int currentIndex,
    @Default(null) String? errorMessage,
  }) = _HomeState;
}

extension HomeStateX on HomeState {
  int get totalSlides => slides.length;
  bool get isLastSlide => currentIndex >= totalSlides - 1;
  bool get isFirstSlide => currentIndex <= 0;
  bool get isEmpty => slides.isEmpty;
  bool get isNotEmpty => slides.isNotEmpty;
  bool get isNearEnd => totalSlides - currentIndex <= 5;
}
