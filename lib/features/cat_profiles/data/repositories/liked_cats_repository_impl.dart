import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_liked_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/repositories/liked_cats_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LikedCatsRepository)
class LikedCatsRepositoryImpl implements LikedCatsRepository {
  final List<CatLikedEntity> _likedCats = <CatLikedEntity>[];

  @override
  List<CatLikedEntity> getAllLikedCats() => _likedCats;

  @override
  int getLikesCount() => _likedCats.length;

  @override
  void addCat(CatLikedEntity cat) {
    final exists = _likedCats.any(
      (CatLikedEntity likedCat) => cat.cat.id == likedCat.cat.id,
    );
    if (!exists) {
      _likedCats.add(cat);
    }
  }

  @override
  void removeCat(CatEntity cat) {
    _likedCats.removeWhere(
      (CatLikedEntity likedCat) => cat.id == likedCat.cat.id,
    );
  }

  @override
  void clearLikedCats() {
    _likedCats.clear();
  }
}
