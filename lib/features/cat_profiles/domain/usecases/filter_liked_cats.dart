import 'package:cat_tinder/core/common_domain/usecases/base_params_usecase.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_liked_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/repositories/liked_cats_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class FilterLikedCats
    extends BaseParamsUseCase<Iterable<CatLikedEntity>, String> {
  final LikedCatsRepository repository;

  FilterLikedCats(this.repository);

  @override
  List<CatLikedEntity> call(String breedName) {
    return repository.filterCatsByBreedName(breedName);
  }
}
