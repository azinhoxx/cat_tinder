import 'package:cat_tinder/core/common_domain/entities/based_api_result/api_result_model.dart';
import 'package:cat_tinder/features/cat_profiles/data/models/cat_model.dart';

abstract class CatRemoteDataSource {
  Future<ApiResultModel<List<CatModel?>?>> getCats();
}
