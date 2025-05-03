import 'package:cat_tinder/core/common_domain/entities/based_api_result/api_result_model.dart';
import 'package:cat_tinder/core/common_domain/entities/based_api_result/error_result_model.dart';
import 'package:cat_tinder/features/cat_profiles/data/datasources/local_datasource/liked_cats_local_datasource.dart';
import 'package:cat_tinder/features/cat_profiles/data/mappers/cat_liked_entity_to_model_mapper.dart';
import 'package:cat_tinder/features/cat_profiles/data/models/cat_liked_model.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_liked_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/repositories/liked_cats_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: LikedCatsRepository)
class LikedCatsRepositoryImpl implements LikedCatsRepository {
  final LikedCatsLocalDatasource likedCatsDatasource;

  LikedCatsRepositoryImpl({required this.likedCatsDatasource});

  @override
  Future<ApiResultModel<List<CatLikedEntity>>> getCats() async {
    try {
      final ApiResultModel<List<CatLikedModel>> response =
          await likedCatsDatasource.getCats();
      return response.when(
        success: (List<CatLikedModel> listCatModel) {
          return ApiResultModel<List<CatLikedEntity>>.success(
            data: listCatModel.map((e) => e.mapToEntity()).toList(),
          );
        },
        failure: (ErrorResultModel errorModel) {
          return ApiResultModel<List<CatLikedEntity>>.failure(
            errorResultEntity: errorModel,
          );
        },
      );
    } catch (e) {
      return ApiResultModel<List<CatLikedEntity>>.failure(
        errorResultEntity: ErrorResultModel(
          message: 'Something went wrong: $e',
        ),
      );
    }
  }

  @override
  Future<ApiResultModel<void>> saveCats(List<CatLikedEntity> cats) async {
    try {
      final List<CatLikedModel> mapped =
          cats.map((e) => e.mapToModel()).toList();

      final ApiResultModel<void> response = await likedCatsDatasource.saveCats(
        mapped,
      );

      return response.when(
        success: (_) {
          return ApiResultModel<void>.success(data: null);
        },
        failure: (ErrorResultModel errorModel) {
          return ApiResultModel<void>.failure(errorResultEntity: errorModel);
        },
      );
    } catch (e) {
      return ApiResultModel<void>.failure(
        errorResultEntity: ErrorResultModel(
          message: 'Something went wrong: $e',
        ),
      );
    }
  }
}
