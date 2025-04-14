import 'package:cat_tinder/core/common_domain/usecases/base_params_usecase.dart';
import 'package:cat_tinder/features/cat_profiles/domain/repositories/liked_cats_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetLikesCount extends BaseParamsUseCase<int, NoParams> {
  final LikedCatsRepository repository;

  GetLikesCount(this.repository);

  @override
  int call([NoParams params = const NoParams()]) {
    return repository.getLikesCount();
  }
}
