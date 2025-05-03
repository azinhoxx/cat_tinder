import 'package:cat_tinder/core/common_domain/entities/based_api_result/error_result_model.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/services/swiper_controller_service.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/usecases/get_all_cats.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/home_cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final GetAllCats _getAllCats;
  final SwiperControllerService swiperService = SwiperControllerService(
    CardSwiperController(),
  );

  HomeCubit(this._getAllCats) : super(HomeState());

  Future<void> fetchSlides() async {
    if (state.isFetching) return;

    emit(state.copyWith(isFetching: true));

    final List<CatEntity> newSlides = <CatEntity>[...state.slides];
    ErrorResultModel? newError;

    final response = await _getAllCats();
    response.when(
      success: (List<CatEntity?>? cats) {
        if (cats != null) {
          final List<CatEntity> filtered =
              cats.nonNulls
                  .where(
                    (CatEntity cat) =>
                        cat.url != null && cat.id != null && cat.breeds != null,
                  )
                  .toList();

          final List<CatEntity> uniqueCats = [];
          final Set<String> seenIds = {};

          for (final cat in newSlides) {
            seenIds.add(cat.id!);
          }

          for (final cat in filtered) {
            if (seenIds.add(cat.id!)) {
              uniqueCats.add(cat);
            }
          }

          newSlides.addAll(uniqueCats);
        }
      },
      failure: (ErrorResultModel errorModel) {
        newError = errorModel;
      },
    );

    emit(
      state.copyWith(
        isFetching: false,
        isFirstLoading: false,
        slides: newSlides,
        error: newError,
      ),
    );
  }

  void updateIndex(int? index) {
    emit(state.copyWith(currentIndex: index ?? state.currentIndex));
  }

  Future<void> updateSlides() async {
    if (state.isNearEnd) {
      fetchSlides();
    }
  }

  @override
  Future<void> close() {
    swiperService.controller.dispose();
    return super.close();
  }
}
