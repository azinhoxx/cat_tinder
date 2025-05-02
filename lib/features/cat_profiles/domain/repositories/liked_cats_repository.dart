import 'package:cat_tinder/core/common_domain/entities/based_api_result/api_result_model.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_liked_entity.dart';

abstract class LikedCatsRepository {
  Future<ApiResultModel<List<CatLikedEntity>>> getCats();
  Future<ApiResultModel<void>> saveCats(List<CatLikedEntity> cats);
}
