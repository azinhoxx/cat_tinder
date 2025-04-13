import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/slide.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    required bool isLoading,
    required bool isFirstLoading,
    required List<Slide> slides,
    required int currentIndex,
    required int likesCount,
    String? errorMessage,
  }) = _HomeState;

  factory HomeState.initial() => const HomeState(
    isLoading: true,
    isFirstLoading: true,
    slides: [],
    currentIndex: 0,
    likesCount: 0,
    errorMessage: null,
  );

  factory HomeState.loaded({required List<Slide> slides}) => HomeState(
    isLoading: false,
    isFirstLoading: false,
    slides: slides,
    currentIndex: 0,
    likesCount: 0,
    errorMessage: null,
  );
}

extension HomeScreenGetters on HomeState {
  bool get isEnd => currentIndex >= slides.length;
  bool get isStart => currentIndex <= 0;
  bool get isEmpty => slides.isEmpty;
}
