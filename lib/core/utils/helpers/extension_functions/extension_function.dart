import 'dart:convert';

import 'package:http/http.dart';

extension ExtensionsOnString on String {
  Uri parseUri({Map<String, dynamic>? params}) {
    return Uri.parse(this).replace(
      queryParameters: params?.map(
        (String key, dynamic value) =>
            MapEntry<String, dynamic>(key, value.toString()),
      ),
    );
  }
}

extension ExtensionsOnHttpResponse on Response {
  dynamic decodeJson() {
    return jsonDecode(body);
  }
}
