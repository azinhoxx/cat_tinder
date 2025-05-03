import 'dart:async';

import 'package:cat_tinder/core/common_domain/entities/based_api_result/api_result_model.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_liked_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/usecases/get_all_liked_cats.dart';
import 'package:cat_tinder/features/cat_profiles/domain/usecases/save_all_liked_cats.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LikedCatsCubit extends Cubit<LikedCatsState> {
  final GetAllLikedCats _getAllLikedCats;
  final SaveAllLikedCats _saveAllLikedCats;

  Timer? _saveTimer;

  LikedCatsCubit(this._getAllLikedCats, this._saveAllLikedCats)
    : super(LikedCatsState());

  Future<List<CatLikedEntity>> _getCats() async {
    final ApiResultModel<List<CatLikedEntity>> response =
        await _getAllLikedCats();

    final List<CatLikedEntity> cats = [];

    response.when(
      success: (List<CatLikedEntity> catsResponse) {
        cats.addAll(catsResponse);
      },
      failure: (_) {},
    );

    return cats;
  }

  Future<void> loadCats() async {
    emit(state.copyWith(likedCats: await _getCats(), isFirstLoading: false));
  }

  void addCat(CatEntity cat) {
    final CatLikedEntity entity = CatLikedEntity(
      cat: cat,
      likedAt: DateTime.now(),
    );

    final exists = state.likedCats.any(
      (CatLikedEntity likedCat) => entity.cat.id == likedCat.cat.id,
    );

    if (!exists) {
      emit(state.copyWith(likedCats: [...state.likedCats, entity]));
      _debouncedSave();
    }
  }

  void filterCatsByBreedName(String breedName) {
    final lowerBreedName = breedName.toLowerCase();

    final filterred =
        state.likedCats
            .where(
              (CatLikedEntity likedCat) => likedCat.cat.breeds![0]!.name!
                  .toLowerCase()
                  .contains(lowerBreedName),
            )
            .toList();

    emit(state.copyWith(filteredCats: filterred));
  }

  void removeCat(CatEntity cat) {
    final updatedList =
        state.likedCats.where((likedCat) => likedCat.cat.id != cat.id).toList();
    final filteredCats =
        state.filteredCats
            .where((likedCat) => likedCat.cat.id != cat.id)
            .toList();

    emit(state.copyWith(likedCats: updatedList, filteredCats: filteredCats));
    _debouncedSave();
  }

  void initFilterList() {
    emit(state.copyWith(filteredCats: state.likedCats));
  }

  Future<void> saveCats() async {
    final ApiResultModel<void> response = await _saveAllLikedCats(
      state.likedCats,
    );

    response.when(success: (_) {}, failure: (_) {});
  }

  void _debouncedSave() {
    _saveTimer?.cancel();
    _saveTimer = Timer(const Duration(milliseconds: 1000), saveCats);
  }

  @override
  Future<void> close() {
    _saveTimer?.cancel();
    return super.close();
  }
}
