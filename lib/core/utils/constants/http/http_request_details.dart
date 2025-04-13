abstract final class HttpRequestDetails {
  HttpRequestDetails._();

  static const String baseUri = '';

  static const String hasBreedsKey = 'has_breeds';
  static const int hasBreedsValue = 1;

  static const String limitKey = 'limit';
  static const int limitValue = 3;

  static const Duration timeOutDuration = Duration(seconds: 20);
}
