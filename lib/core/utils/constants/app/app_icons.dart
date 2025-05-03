import 'package:flutter/material.dart';

abstract final class AppIcons {
  AppIcons._();

  static const _fontFamily = 'CVIcons';

  static const IconData undo = IconData(0xe801, fontFamily: _fontFamily);
  static const IconData like = IconData(0xe800, fontFamily: _fontFamily);
  static const IconData dislike = IconData(0xe802, fontFamily: _fontFamily);
  static const IconData cat = IconData(0xe803, fontFamily: _fontFamily);
  static const IconData refresh = IconData(0xe805, fontFamily: _fontFamily);
  static const IconData heartHandWritten = IconData(
    0xe804,
    fontFamily: _fontFamily,
  );
  static const IconData toastCheck = IconData(0xf06d, fontFamily: _fontFamily);
  static const IconData toastWarning = IconData(
    0xe806,
    fontFamily: _fontFamily,
  );
}
