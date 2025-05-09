import 'package:cat_tinder/core/common_domain/entities/based_api_result/api_result_model.dart';
import 'package:cat_tinder/core/common_domain/usecases/base_params_usecase.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_liked_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/repositories/liked_cats_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllLikedCats
    implements BaseApiParamsUseCase<List<CatLikedEntity>, NoParams> {
  final LikedCatsRepository repository;

  const GetAllLikedCats(this.repository);

  @override
  Future<ApiResultModel<List<CatLikedEntity>>> call([
    NoParams? params = const NoParams(),
  ]) {
    return repository.getCats();
  }
}
