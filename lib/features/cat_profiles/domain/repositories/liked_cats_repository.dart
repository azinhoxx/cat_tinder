import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_liked_entity.dart';

abstract class LikedCatsRepository {
  List<CatLikedEntity> getAllLikedCats();
  void addCat(CatLikedEntity cat);
  void removeCat(CatEntity cat);
  void clearCats();
  int getLikesCount();
  List<CatLikedEntity> filterCatsByBreedName(String breedName);
}
