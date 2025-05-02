import 'package:cat_tinder/core/common_domain/entities/based_api_result/api_result_model.dart';
import 'package:cat_tinder/core/common_domain/usecases/base_params_usecase.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_liked_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/repositories/liked_cats_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class SaveAllLikedCats
    implements BaseApiParamsUseCase<void, List<CatLikedEntity>> {
  final LikedCatsRepository repository;

  const SaveAllLikedCats(this.repository);

  @override
  Future<ApiResultModel<void>> call(List<CatLikedEntity> params) {
    return repository.saveCats(params);
  }
}
