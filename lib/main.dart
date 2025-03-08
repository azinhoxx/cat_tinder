import 'package:flutter/material.dart' show runApp;
import 'package:flutter_hw_1/app/app.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(const CatTinderApp());
}
