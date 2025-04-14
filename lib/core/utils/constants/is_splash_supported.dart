import 'dart:io';

import 'package:flutter/foundation.dart';

final bool kIsSplashSupportedPlatform =
    kIsWeb || Platform.isIOS || Platform.isAndroid;
