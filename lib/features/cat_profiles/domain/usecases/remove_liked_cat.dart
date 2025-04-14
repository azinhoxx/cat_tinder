import 'package:cat_tinder/core/common_domain/usecases/base_params_usecase.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/repositories/liked_cats_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class RemoveLikedCat implements BaseParamsUseCase<void, CatEntity> {
  final LikedCatsRepository repository;

  RemoveLikedCat(this.repository);

  @override
  void call(CatEntity cat) {
    repository.removeCat(cat);
  }
}
