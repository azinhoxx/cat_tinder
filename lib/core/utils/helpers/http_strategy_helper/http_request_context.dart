import 'dart:async';
import 'dart:io';

import 'package:cat_tinder/core/common_domain/entities/based_api_result/api_result_model.dart';
import 'package:cat_tinder/core/common_domain/entities/based_api_result/error_result_model.dart';
import 'package:cat_tinder/core/utils/constants/app/app_base_url.dart';
import 'package:cat_tinder/core/utils/constants/http/http_request_errors.dart';
import 'package:cat_tinder/core/utils/helpers/connectivity_helper/connectivity_checker_helper.dart';
import 'package:cat_tinder/core/utils/helpers/custom_exceptions/custom_connection_exception.dart';
import 'package:cat_tinder/core/utils/helpers/http_strategy_helper/http_request_strategy.dart';
import 'package:http/http.dart' as http;
import 'package:cat_tinder/core/utils/constants/http/http_client_headers.dart';
import 'package:injectable/injectable.dart';

@injectable
class HttpRequestContext {
  final ConnectivityCheckerHelper connectivityCheckerHelper;
  final String? baseUrl = AppBaseUrl.baseUrl;
  Map<String, String> _sharedDefaultHeader = <String, String>{};

  HttpRequestContext(this.connectivityCheckerHelper);

  Future<void> initSharedDefaultHeader([
    String contentValue = HttpClientHeaders.contentTypeValue,
  ]) async {
    _sharedDefaultHeader = <String, String>{};
    _sharedDefaultHeader.addAll(<String, String>{
      HttpClientHeaders.contentTypeKey: contentValue,
    });
  }

  Future<bool> _getConnectivityState() async {
    final bool result = await connectivityCheckerHelper.checkConnectivity();
    return result;
  }

  Future<ApiResultModel<http.Response>> makeRequest({
    required String uri,
    required HttpRequestStrategy httpRequestStrategy,
    Map<String, String> headers = const <String, String>{},
    Map<String, dynamic> requestData = const <String, dynamic>{},
  }) async {
    await initSharedDefaultHeader();
    _sharedDefaultHeader.addAll(headers);
    if (await _getConnectivityState()) {
      try {
        final String url = '$baseUrl$uri';
        return httpRequestStrategy.executeRequest(
          uri: url,
          headers: _sharedDefaultHeader,
          requestData: requestData,
        );
      } on TimeoutException catch (_) {
        return const ApiResultModel<http.Response>.failure(
          errorResultEntity: ErrorResultModel(
            message: HttpRequestErrors.commonErrorUnexpectedMessage,
            statusCode: HttpRequestErrors.timeoutRequestStatusCode,
          ),
        );
      } on IOException catch (_) {
        throw CustomConnectionException(
          exceptionMessage: HttpRequestErrors.commonConnectionFailedMessage,
          exceptionCode: HttpRequestErrors.ioExceptionStatusCode,
        );
      }
    } else {
      throw CustomConnectionException(
        exceptionMessage: HttpRequestErrors.commonConnectionFailedMessage,
        exceptionCode: HttpRequestErrors.ioExceptionStatusCode,
      );
    }
  }
}
