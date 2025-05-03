import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_liked_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'liked_cats_state.freezed.dart';

@freezed
class LikedCatsState with _$LikedCatsState {
  const factory LikedCatsState({
    @Default([]) List<CatLikedEntity> likedCats,
    @Default([]) List<CatLikedEntity> filteredCats,
    @Default(true) bool isFirstLoading,
    @Default('') String currentFilter,
  }) = _LikedCatsState;
}

extension LikedCatsCubitX on LikedCatsState {
  int get likesCount => likedCats.length;
}
