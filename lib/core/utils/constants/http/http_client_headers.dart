import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract final class HttpClientHeaders {
  HttpClientHeaders._();

  static const String contentTypeKey = 'Content-Type';
  static const String contentTypeValue = 'application/json';
  static const String xApiKeyKey = 'x-api-key';
  static final String xApiKeyValue = dotenv.env['CATS_API_KEY']!;
}
