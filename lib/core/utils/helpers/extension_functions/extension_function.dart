import 'dart:convert';

import 'package:http/http.dart';

extension StringX on String {
  Uri parseUri({Map<String, dynamic>? params}) {
    return Uri.parse(this).replace(
      queryParameters: params?.map(
        (String key, dynamic value) =>
            MapEntry<String, dynamic>(key, value.toString()),
      ),
    );
  }
}

extension HttpResponseX on Response {
  dynamic decodeJson() {
    return jsonDecode(body);
  }
}
