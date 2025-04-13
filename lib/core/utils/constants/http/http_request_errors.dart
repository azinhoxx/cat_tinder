abstract final class HttpRequestErrors {
  HttpRequestErrors._();

  static const String commonConnectionFailedMessage =
      'Please, check your Internet Connection';
  static const int ioExceptionStatusCode = 900;

  static const String commonErrorUnexpectedMessage =
      'Something went wrong. Please try again';
  static const int timeoutRequestStatusCode = 1000;
}
