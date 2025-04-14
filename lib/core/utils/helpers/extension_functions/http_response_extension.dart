import 'package:cat_tinder/core/common_domain/entities/based_api_result/api_result_model.dart';
import 'package:cat_tinder/core/common_domain/entities/based_api_result/error_result_model.dart';
import 'package:http/http.dart' as http;

extension HttpResponseX on http.Response {
  ApiResultModel<http.Response> performHttpRequest() {
    if (statusCode >= 200 && statusCode < 300) {
      return ApiResultModel<http.Response>.success(data: this);
    }
    return ApiResultModel<http.Response>.failure(
      errorResultEntity: ErrorResultModel(
        message: reasonPhrase,
        statusCode: statusCode,
      ),
    );
  }
}
