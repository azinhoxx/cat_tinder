import 'package:cat_tinder/core/common_domain/entities/based_api_result/api_result_model.dart';
import 'package:cat_tinder/core/common_domain/entities/based_api_result/error_result_model.dart';
import 'package:cat_tinder/core/utils/helpers/custom_exceptions/custom_connection_exception.dart';
import 'package:cat_tinder/features/cat_profiles/data/datasources/remote_datasource/cat_remote_datasource.dart';
import 'package:cat_tinder/features/cat_profiles/data/models/cat_model.dart';
import 'package:cat_tinder/features/cat_profiles/domain/entities/cat_entity.dart';
import 'package:cat_tinder/features/cat_profiles/domain/repositories/cat_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CatRepository)
class CatRepositoryImpl implements CatRepository {
  final CatRemoteDataSource remoteDataSource;

  CatRepositoryImpl({required this.remoteDataSource});

  @override
  Future<ApiResultModel<List<CatEntity?>?>> getCats() async {
    try {
      final ApiResultModel<List<CatModel?>?> response =
          await remoteDataSource.getCats();
      return response.when(
        success: (List<CatModel?>? listCatModel) {
          return ApiResultModel<List<CatEntity?>?>.success(
            data: listCatModel?.map((e) => e?.mapToEntity()).toList(),
          );
        },
        failure: (ErrorResultModel errorModel) {
          return ApiResultModel<List<CatEntity?>?>.failure(
            errorResultEntity: errorModel,
          );
        },
      );
    } on CustomConnectionException catch (e) {
      throw CustomConnectionException(
        exceptionCode: e.exceptionCode,
        exceptionMessage: e.exceptionMessage,
      );
    }
  }
}
