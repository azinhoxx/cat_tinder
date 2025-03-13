import 'package:flutter/material.dart';
import 'package:flutter_hw_1/models/cat_model.dart';

class CatModelProvider extends InheritedWidget {
  final CatModel cat;

  const CatModelProvider({super.key, required this.cat, required super.child});

  static CatModelProvider of(BuildContext context) =>
      context.getInheritedWidgetOfExactType<CatModelProvider>()!;

  @override
  bool updateShouldNotify(CatModelProvider oldWidget) => false;
}
