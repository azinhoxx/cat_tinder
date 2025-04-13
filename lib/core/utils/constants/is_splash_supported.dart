import 'dart:io';

import 'package:flutter/foundation.dart';

final bool isSplashSupportedPlatform =
    kIsWeb || Platform.isIOS || Platform.isAndroid;
