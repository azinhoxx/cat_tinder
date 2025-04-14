import 'package:cat_tinder/core/common_domain/usecases/base_params_usecase.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_liked_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/repositories/liked_cats_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddLikedCat extends BaseParamsUseCase<void, CatLikedEntity> {
  final LikedCatsRepository repository;

  AddLikedCat(this.repository);

  @override
  void call(CatLikedEntity cat) {
    repository.addCat(cat);
  }
}
