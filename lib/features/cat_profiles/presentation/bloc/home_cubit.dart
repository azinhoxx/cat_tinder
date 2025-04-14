import 'package:cat_tinder/core/common_domain/entities/based_api_result/error_result_model.dart';
import 'package:cat_tinder/core/common_domain/usecases/base_params_usecase.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/services/swiper_controller_service.dart';
import 'package:cat_tinder/core/utils/constants/is_splash_supported.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/usecases/get_all_cats.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetAllCats _getAllCats;
  final SwiperControllerService swiperService;

  HomeCubit(this._getAllCats, this.swiperService) : super(HomeState.initial());

  Future<void> fetchSlides() async {
    if (state.isFetching) return;

    emit(state.copyWith(isFetching: true));

    final List<CatEntity> newSlides = <CatEntity>[...state.slides];
    String? newErrorMessage;

    final response = await _getAllCats(NoParams());
    response.when(
      success: (List<CatEntity?>? cats) {
        if (cats != null) {
          newSlides.addAll(
            cats.nonNulls.where((cat) => cat.url != null).toList(),
          );
        }
      },
      failure: (ErrorResultModel errorModel) {
        newErrorMessage = errorModel.message;
      },
    );

    if (state.isFirstLoading && kIsSplashSupportedPlatform) {
      FlutterNativeSplash.remove();
    }

    emit(
      state.copyWith(
        isFetching: false,
        isFirstLoading: false,
        slides: newSlides,
        errorMessage: newErrorMessage,
      ),
    );
  }

  void updateSlides() {
    if (state.isNearEnd) {
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

  @override
  Future<void> close() {
    swiperService.controller.dispose();
    return super.close();
  }
}
