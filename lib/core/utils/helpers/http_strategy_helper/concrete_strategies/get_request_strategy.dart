import 'package:cat_tinder/core/common_domain/entities/based_api_result/api_result_model.dart';
import 'package:cat_tinder/core/utils/constants/http/http_request_details.dart';
import 'package:cat_tinder/core/utils/helpers/extension_functions/extension_function.dart';
import 'package:cat_tinder/core/utils/helpers/extension_functions/http_response_extension.dart';
import 'package:cat_tinder/core/utils/helpers/http_strategy_helper/http_request_strategy.dart';
import 'package:http/http.dart' as http;

class GetRequestStrategy implements HttpRequestStrategy {
  @override
  Future<ApiResultModel<http.Response>> executeRequest({
    required String uri,
    Map<String, String> headers = const <String, String>{},
    Map<String, dynamic> requestData = const <String, dynamic>{},
  }) async {
    final http.Response response = await http
        .get(uri.parseUri(params: requestData), headers: headers)
        .timeout(HttpRequestDetails.timeOutDuration);
    return response.performHttpRequest();
  }
}
