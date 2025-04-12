import 'package:cat_tinder/core/common_domain/entities/based_api_result/api_result_model.dart';
import 'package:cat_tinder/core/common_domain/entities/based_api_result/error_result_model.dart';
import 'package:cat_tinder/core/utils/constants/http_client_headers.dart';
import 'package:cat_tinder/core/utils/constants/http_request_details.dart';
import 'package:cat_tinder/core/utils/helpers/custom_exceptions/custom_connection_exception.dart';
import 'package:cat_tinder/core/utils/helpers/extension_functions/extension_function.dart';
import 'package:cat_tinder/core/utils/helpers/http_strategy_helper/concrete_strategies/get_request_strategy.dart';
import 'package:cat_tinder/core/utils/helpers/http_strategy_helper/http_request_context.dart';
import 'package:cat_tinder/features/cat_profiles/data/datasources/remote_datasource/cat_remote_datasource.dart';
import 'package:cat_tinder/features/cat_profiles/data/models/cat_model.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CatRemoteDataSource)
class CatRemoteDatasourceImpl implements CatRemoteDataSource {
  final HttpRequestContext _httpRequestContext;

  CatRemoteDatasourceImpl(this._httpRequestContext);

  @override
  Future<ApiResultModel<List<CatModel?>?>> getCats() async {
    try {
      final ApiResultModel<Response> response = await _httpRequestContext
          .makeRequest(
            httpRequestStrategy: GetRequestStrategy(),
            uri: HttpRequestDetails.baseUri,
            headers: {
              HttpClientHeaders.xApiKeyKey: HttpClientHeaders.xApiKeyValue,
            },
          );
      return response.when(
        success: (Response response) {
          return ApiResultModel<List<CatModel?>?>.success(
            data:
                (response.decodeJson() as List<Map<String, dynamic>>)
                    .map(CatModel.fromJson)
                    .toList(),
          );
        },
        failure: (ErrorResultModel errorModel) {
          return ApiResultModel<List<CatModel?>?>.failure(
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
