import 'package:cat_tinder/core/common_domain/entities/based_api_result/error_result_model.dart';
import 'package:cat_tinder/core/common_domain/usecases/base_params_usecase.dart';
import 'package:cat_tinder/core/utils/constants/is_splash_supported.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/usecases/get_all_cats.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_state.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/widgets/home_screen/slide.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetAllCats _getAllCats;
  final CardSwiperController controller = CardSwiperController();

  HomeCubit(this._getAllCats) : super(HomeState.initial());

  Future<void> fetchSlides() async {
    if (state.isFetching) return;

    emit(state.copyWith(isFetching: true));

    final response = await _getAllCats(NoParams());
    response.when(
      success: (List<CatEntity?>? cats) {
        final slides = <Slide>[];
        if (cats != null) {
          slides.addAll(
            cats
                .where((cat) => cat != null && cat.url != null)
                .map((cat) => Slide(cat: cat!))
                .toList(),
          );
        }
        emit(
          state.copyWith(
            slides: [...state.slides, ...slides],
            errorMessage: null,
          ),
        );
      },
      failure: (ErrorResultModel error) {
        emit(state.copyWith(errorMessage: error.message));
      },
    );

    if (state.isFirstLoading && isSplashSupportedPlatform) {
      FlutterNativeSplash.remove();
    }

    emit(state.copyWith(isFetching: false, isFirstLoading: false));
  }

  void updateSlides() {
    if (state.slides.length - state.currentIndex <= 3) {
      fetchSlides();
    }
  }

  bool onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    emit(
      state.copyWith(
        currentIndex: currentIndex ?? state.currentIndex,
        likesCount:
            direction == CardSwiperDirection.right
                ? state.likesCount + 1
                : state.likesCount,
      ),
    );
    updateSlides();
    return true;
  }

  bool onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    emit(
      state.copyWith(
        currentIndex: currentIndex,
        likesCount:
            direction == CardSwiperDirection.right
                ? state.likesCount - 1
                : state.likesCount,
      ),
    );
    return true;
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

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}
