import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_liked_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/usecases/add_liked_cat.dart';
import 'package:cat_tinder/features/cat_profiles/domain/usecases/filter_liked_cats.dart';
import 'package:cat_tinder/features/cat_profiles/domain/usecases/get_all_liked_cats.dart';
import 'package:cat_tinder/features/cat_profiles/domain/usecases/get_likes_count.dart';
import 'package:cat_tinder/features/cat_profiles/domain/usecases/remove_liked_cat.dart';
import 'package:cat_tinder/features/cat_profiles/presentation/bloc/liked_cats_cubit/liked_cats_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LikedCatsCubit extends Cubit<LikedCatsState> {
  final GetAllLikedCats _getAllLikedCats;
  final AddLikedCat _addLikedCat;
  final RemoveLikedCat _removeLikedCat;
  final GetLikesCount _getLikesCount;
  final FilterLikedCats _filterLikedCats;

  LikedCatsCubit(
    this._getAllLikedCats,
    this._addLikedCat,
    this._removeLikedCat,
    this._getLikesCount,
    this._filterLikedCats,
  ) : super(LikedCatsState());

  void loadCats() {
    emit(
      state.copyWith(
        likedCats: _getAllLikedCats(),
        likesCount: _getLikesCount(),
      ),
    );
  }

  void addCat(CatEntity cat) {
    _addLikedCat(CatLikedEntity(cat: cat, likedAt: DateTime.now()));
    loadCats();
  }

  void removeCat(CatEntity cat) {
    _removeLikedCat(cat);

    final updatedFiltered = _filterLikedCats(state.currentFilter);
    emit(
      state.copyWith(
        likedCats: _getAllLikedCats(),
        filteredCats: updatedFiltered,
        likesCount: _getLikesCount(),
      ),
    );
  }

  void filterCatsByBreedName(String breedName) {
    emit(
      state.copyWith(
        filteredCats: _filterLikedCats(breedName),
        currentFilter: breedName,
      ),
    );
  }

  void initFilterList() {
    emit(state.copyWith(filteredCats: _filterLikedCats('')));
  }
}
