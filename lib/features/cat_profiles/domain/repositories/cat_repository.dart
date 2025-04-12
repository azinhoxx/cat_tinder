import 'package:cat_tinder/core/common_domain/entities/based_api_result/api_result_model.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';

abstract class CatRepository {
  Future<ApiResultModel<List<CatEntity?>?>> getCats();
}
