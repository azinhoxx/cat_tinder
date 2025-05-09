import 'package:cat_tinder/core/common_domain/entities/based_api_result/api_result_model.dart';
import 'package:cat_tinder/core/common_domain/usecases/base_params_usecase.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/repositories/cat_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAllCats implements BaseApiParamsUseCase<List<CatEntity?>?, NoParams> {
  final CatRepository repository;

  const GetAllCats(this.repository);

  @override
  Future<ApiResultModel<List<CatEntity?>?>> call([
    NoParams? params = const NoParams(),
  ]) {
    return repository.getCats();
  }
}
